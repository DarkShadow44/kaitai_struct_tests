# Autogenerated from KST: please remove this line if doing any edits by hand!

let r = CastToTop.fromFile("src" / "fixed_struct.bin")

check(r.code == 80)
check(r.header.code == 65)
check(r.headerCasted.code == 65)
