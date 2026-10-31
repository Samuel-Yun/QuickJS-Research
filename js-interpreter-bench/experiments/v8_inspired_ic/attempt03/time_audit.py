"""Portable raw-only timeline check; --live prints, final mode writes once."""
import argparse,json,time
from datetime import datetime,timezone
from pathlib import Path
HERE=Path(__file__).resolve().parent
def main():
    p=argparse.ArgumentParser();p.add_argument('--live',action='store_true');a=p.parse_args()
    rows=[json.loads(f.read_text(encoding='utf-8')) for f in (HERE/'raw/formal').rglob('*.json')]
    rows.sort(key=lambda r:r['schedule_index']);assert rows
    total=sum(r['outer_wall_ns'] for r in rows)/1e9
    span=(rows[-1]['outer_stop_ns']-rows[0]['outer_start_ns'])/1e9
    utc=(datetime.fromisoformat(rows[-1]['completed_at'])-datetime.fromisoformat(rows[0]['timestamp'])).total_seconds()
    gaps=[(b['outer_start_ns']-r['outer_stop_ns'])/1e9 for r,b in zip(rows,rows[1:])]
    utc_gaps=[(datetime.fromisoformat(b['timestamp'])-datetime.fromisoformat(r['completed_at'])).total_seconds() for r,b in zip(rows,rows[1:])]
    per_row_utc_error=[(datetime.fromisoformat(r['completed_at'])-datetime.fromisoformat(r['timestamp'])).total_seconds()-r['outer_wall_ns']/1e9 for r in rows]
    bootset=sorted(set(r['boot_id'] for r in rows)|set(r['boot_id_after'] for r in rows))
    result=dict(observed_at=datetime.now(timezone.utc).isoformat(),rows=len(rows),first=rows[0]['timestamp'],last=rows[-1]['completed_at'],
        total_external_child_intervals_seconds=total,monotonic_span_seconds=span,UTC_span_seconds=utc,
        minimum_gap_seconds=min(gaps) if gaps else None,between_process_overhead_seconds=sum(gaps),
        UTC_minus_monotonic_span_seconds=utc-span,minimum_UTC_gap_seconds=min(utc_gaps) if utc_gaps else None,
        largest_absolute_per_row_UTC_interval_difference_seconds=max(map(abs,per_row_utc_error)),
        UTC_clock_adjustment_cause='UNKNOWN; UTC labels are not the timing source',
        serialized=all(g>=0 for g in gaps),single_boot=len(bootset)==1,boot_ids=bootset,
        note='UTC is provenance only; timing uses native monotonic clock, not UI tool latency. No old cohort or predicted records counted.')
    assert result['serialized'] and result['single_boot'] and abs(total+sum(gaps)-span)<.001
    if not a.live:
        assert (HERE/'collection_end.json').exists();dest=HERE/'timeline_audit.json';assert not dest.exists();dest.write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8')
    print(json.dumps(result,indent=2))
if __name__=='__main__':main()
