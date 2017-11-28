#!/usr/bin/env cwlrunner
cwlVersion: v1.0
class: CommandLineTool
baseCommand: ["python", "-m", "nlppln.commands.copy_and_rename"]
doc: |
  Copy a file and optionally rename it.

  File renaming options are: copy (don't rename), spaces (remove spaces, default),
  and random (generate a random file name. The file extension is copied too.)
  If the renaming option is spaces, this tool must be run with the
  --relax-path-checks option, because it accepts file names with spaces, which
  CWL normally does not accept.

inputs:
  in_file:
    type: File
    inputBinding:
      position: 1
  rename:
    type: string?
    inputBinding:
      prefix: --rename
  out_dir:
    type: Directory?
    inputBinding:
      prefix: --out_dir

outputs:
  copy:
    type: File
    outputBinding:
      glob: "*"