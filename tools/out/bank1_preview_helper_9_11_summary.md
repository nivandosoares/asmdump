# Bank1 Preview Helper 9..11 Summary

## Entries

- helper 9 bg1: rom 0x070000, decoded 11348/16640 bytes, mismatch=True, non_backdrop=0, colors=1
- helper 9 bg2: rom 0x070000, decoded 11348/16640 bytes, mismatch=True, non_backdrop=14336, colors=2
- helper 10 bg1: rom 0x0711FE, decoded 13111/16640 bytes, mismatch=True, non_backdrop=0, colors=1
- helper 10 bg2: rom 0x0711FE, decoded 13111/16640 bytes, mismatch=True, non_backdrop=0, colors=1
- helper 11 bg1: rom 0x072428, decoded 4117/17024 bytes, mismatch=True, non_backdrop=0, colors=1
- helper 11 bg2: rom 0x072428, decoded 4117/17024 bytes, mismatch=True, non_backdrop=0, colors=1

## Pairwise diffs

- bg1 9 vs 10: 57344 pixels differ
- bg1 9 vs 11: 57344 pixels differ
- bg1 10 vs 11: 57344 pixels differ
- bg2 9 vs 10: 57344 pixels differ
- bg2 9 vs 11: 57344 pixels differ
- bg2 10 vs 11: 57344 pixels differ

## Notes

- One-shot helper model only.
- In the clean isolated-layer rebuild, only helper 9 carries visible non-backdrop BG2 content; helpers 10 and 11 remain blank in both BG1 and BG2.
