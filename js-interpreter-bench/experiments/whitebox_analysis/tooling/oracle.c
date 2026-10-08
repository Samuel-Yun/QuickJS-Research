/* Independent binary64 Gauss-Seidel expression oracle. Not a runtime benchmark. */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
int main(int argc,char **argv) {
  if(argc!=2)return 2;int n=atoi(argv[1]),w=64,stride=66,size=66*66;
  double *x=calloc(size,sizeof(double)),*s=calloc(size,sizeof(double));
  if(!x||!s)return 3;
  for(int j=1;j<=w;j++)for(int i=1;i<=w;i++)s[j*stride+i]=((i*17+j*31)&255)/256.0;
  for(int run=0;run<n;run++)for(int k=0;k<20;k++)for(int j=1;j<=w;j++) {
    int previous=(j-1)*stride,cur=j*stride,next=(j+1)*stride;
    double last=x[cur];cur++;
    for(int i=1;i<=w;i++) {
      int target=cur;double source=s[cur];
      double v=last+x[++cur];v=v+x[++previous];v=v+x[++next];
      last=(source+1.0*v)*0.25;x[target]=last;
    }
  }
  uint32_t sum=0;for(int i=0;i<size;i++)sum+=(uint32_t)floor(x[i]*1048576.0+0.5);
  printf("%u\n",sum);free(x);free(s);return 0;
}
