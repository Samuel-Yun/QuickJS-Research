"""Offline verification of earlier diagnostic archives; never runs an engine."""
import sys
sys.dont_write_bytecode = True
import csv
import gzip
import hashlib
import json
import re
from run import HERE, ROOT, read, save, sha

def rows(path):
    with path.open(encoding="utf-8-sig", newline="") as f:
        return list(csv.DictReader(f))

def archive(path):
    meta = read(path.with_name(path.name.replace(".json.gz", ".identity.json")))
    assert sha(path) == meta["compressed_sha256"], str(path)
    data = gzip.decompress(path.read_bytes())
    expected = meta.get("uncompressed_sha256", meta.get("raw_sha256"))
    if expected:
        assert hashlib.sha256(data).hexdigest() == expected
    return json.loads(data)

def matching(report, row):
    functions = [f for f in report["functions"]
                 if hashlib.sha256(bytes.fromhex(f["source_hex"])).hexdigest() == row["source_sha256"]
                 and f["instance_id"] == int(row["instance_id"])]
    assert len(functions) == 1, row
    f = functions[0]
    assert hashlib.sha256(bytes.fromhex(f["code_before_hex"])).hexdigest() == row.get("code_before_sha256", hashlib.sha256(bytes.fromhex(f["code_before_hex"])).hexdigest())
    operations = [op for op in f["opcodes"] if op["pc"] == int(row["pc"])]
    assert len(operations) == 1
    op = operations[0]
    property_name = bytes.fromhex(op["atom_hex"]).decode()
    assert property_name == row.get("atom", row.get("property"))
    for key in ("operations", "ic_queries", "hits", "misses", "find_normal", "bucket_loads", "chain_probes", "generic_get", "value_int", "value_object"):
        assert op[key] == int(row[key]), (key, row)
    return dict(function=row["function"], pc=op["pc"], property=property_name,
                instance_id=f["instance_id"], source_sha256=row["source_sha256"],
                opcode=op["before_op"], operand=op["operand_before"],
                **{key: op[key] for key in ("operations", "ic_queries", "hits", "misses", "find_normal", "bucket_loads", "chain_probes", "generic_get", "value_int", "value_object")})

def main():
    audit = ROOT / "experiments/ic_mechanism_audit/attempt01"
    inherited = ROOT / "experiments/inherited_method_opportunity/attempt01"
    calls = ROOT / "experiments/function_value_call_path/attempt01"
    dependencies = {}
    own = []
    mechanism = rows(audit / "mechanism_sites.csv")
    for variant in ("A", "M"):
        for n in (1, 2):
            path = audit / f"raw/diagnostic/{variant}.M1.own_integer.N{n}.json.gz"
            report = archive(path)
            dependencies[path.relative_to(ROOT).as_posix()] = sha(path)
            selected = [r for r in mechanism if r["variant"] == variant and r["case"] == "M1.own_integer" and int(r["N"]) == n]
            assert len(selected) == 1
            own.append(dict(variant=variant, N=n, raw=path.relative_to(ROOT).as_posix(), **matching(report, selected[0])))
    richards = []
    previous_sites = rows(inherited / "richards_sites.csv")
    for n in (1, 2):
        path = audit / f"raw/diagnostic/M.Richards.Richards.N{n}.json.gz"
        report = archive(path)
        dependencies[path.relative_to(ROOT).as_posix()] = sha(path)
        reasons_path = audit / f"raw/diagnostic/M_reasons.N{n}.json.gz"
        reasons = archive(reasons_path)
        dependencies[reasons_path.relative_to(ROOT).as_posix()] = sha(reasons_path)
        source_map = {s["source_id"]: s["source_hex"] for s in reasons["sources"]}
        for site in previous_sites:
            identity = next(v for v in json.loads(site["QJS_raw_identity"]) if v["N"] == n)
            assert sha(path) == identity["sha256"]
            f = next(f for f in report["functions"] if f["instance_id"] == identity["instance_id"])
            assert hashlib.sha256(bytes.fromhex(f["source_hex"])).hexdigest() == identity["source_sha256"]
            assert hashlib.sha256(bytes.fromhex(f["code_before_hex"])).hexdigest() == identity["code_before_sha256"]
            op = next(op for op in f["opcodes"] if op["pc"] == int(site["QJS_pc"]))
            assert bytes.fromhex(op["atom_hex"]).decode() == site["property"]
            assert op["ic_queries"] == n * int(site["M_reads_per_Run"])
            assert op["hits"] == 0 and op["misses"] == op["ic_queries"]
            rf = [rf for rf in reasons["functions"] if hashlib.sha256(bytes.fromhex(source_map.get(rf["source_id"], ""))).hexdigest() == identity["source_sha256"]]
            assert len(rf) == 1
            rs = next(s for s in rf[0]["sites"] if s["pc"] == op["pc"])
            assert rs["queries"] == rs["fallback"] == rs["inherited"] == op["ic_queries"]
            richards.append(dict(N=n, function=site["QJS_function"], pc=op["pc"],
                                 V8_pc=int(json.loads(site["V8_evidence"])[n-1]["target"]["pc"]),
                                 property=site["property"], instance_id=f["instance_id"],
                                 source_sha256=identity["source_sha256"], code_before_sha256=identity["code_before_sha256"],
                                 queries=op["ic_queries"], hits=op["hits"], fallback=op["misses"],
                                 inherited_reason=rs["inherited"], find_own=op["find_normal"],
                                 receiver=site["receiver"], holder=site["holder"],
                                 receiver_shape_hashed=None, holder_shape_hashed=None))
    value_reads = []
    call_table = rows(calls / "path_counts.csv")
    for variant in ("A", "M"):
        for case in ("number_value_read", "function_value_read", "own_method_call", "local_function_call"):
            for n in (1, 2):
                path = calls / f"raw/diagnostic/{variant}.{case}.N{n}.json.gz"
                report = archive(path)
                dependencies[path.relative_to(ROOT).as_posix()] = sha(path)
                row = next(r for r in call_table if r["variant"] == variant and r["case"] == case and int(r["N"]) == n)
                value_reads.append(dict(variant=variant, case=case, N=n, raw=path.relative_to(ROOT).as_posix(), **matching(report, row)))
    v8 = []
    for n in (1, 2):
        log_path = inherited / f"raw/diagnostic/v8.Richards.N{n}.log.gz"
        log = gzip.decompress(log_path.read_bytes()).decode()
        dependencies[log_path.relative_to(ROOT).as_posix()] = sha(log_path)
        for event in read(inherited / "richards_v8_evidence.json"):
            if event["N"] != n:
                continue
            for transition in event["transitions"]:
                assert ",".join(transition) in log
                assert transition[1] == event["target"]["address"]
                assert transition[8] == event["property"]
            v8.append(dict(N=n, function=event["function"], pc=event["target"]["pc"],
                           instruction=event["target"]["instruction"], property=event["property"],
                           transitions=[t[5:7] for t in event["transitions"]],
                           receiver_maps=event["receiver_maps"], installed_handler=None, per_access_hit_rate=None))
    map_relations = read(inherited / "richards_map_holder_matching.json")
    assert len(map_relations) == 12
    for relation in map_relations:
        n = relation["N"]
        log = gzip.decompress((inherited / f"raw/diagnostic/v8.Richards.N{n}.log.gz").read_bytes()).decode()
        holder_text = (inherited / f"bytecode/Richards/N{n}.holders.txt").read_text(encoding="utf-8")
        assert relation["holder_map_details"] in log
        # The receiver map-details contain the prototype's address in this same process.
        event = next(e for e in read(inherited / "richards_v8_evidence.json") if e["N"] == n and e["function"] == relation["function"] and e["property"] == relation["property"])
        receiver_detail = next(line for line in event["map_details"] if line.split(",")[2] == relation["receiver_map"])
        assert " - prototype: " + relation["prototype_address"] in receiver_detail
        assert relation["prototype_address"] in holder_text and relation["holder_function"] in holder_text
        assert relation["own_descriptor"]["type"] == "function" if "type" in relation["own_descriptor"] else True
    # No cross-campaign timing arithmetic: only the latest campaign's own ratios.
    historical_ratios = rows(calls / "ratios.csv")
    references = [audit / "mechanism_sites.csv", audit / "diagnostic_reasons.csv", inherited / "richards_sites.csv",
                  inherited / "richards_v8_evidence.json", inherited / "richards_map_holder_matching.json",
                  calls / "path_counts.csv", calls / "summary.csv", calls / "ratios.csv",
                  ROOT / "experiments/call_boundary_cost/attempt01/completion.json"]
    for path in references:
        dependencies[path.relative_to(ROOT).as_posix()] = sha(path)
    boundary = read(references[-1])
    save(HERE / "evidence_recheck.json", dict(status="PASS", own_integer=own, Richards=richards,
         value_and_call_reads=value_reads, V8_Richards=v8, receiver_holder_pairs_verified=12,
         latest_campaign_ratios=historical_ratios, previous_call_boundary_status=boundary,
         references_sha256=dependencies, counts_are_not_times=True,
         V8_exact_build_commit=None, V8_installed_handlers=None, prototype_shape_eligibility=None))
    print("EVIDENCE_RECHECK_PASS: compressed archives, source SHA+instance+PC, counters, IC transitions and 12 map/holder pairs")

if __name__ == "__main__":
    main()
