# lualzma
A Lua binding for the LZMA compression algorithm

This lua library wraps the very good LZMA compression algorithm by Igor Pavlov of 7z fame. 

### API
```

lzma(str)
	compress string str (LZMA algorithm)
	return the compressed string or (nil, error message)

unlzma(cstr)
	uncompress string cstr
	return the uncompressed string or (nil, error message)

```

### License and credits

The LZMA code by Igor Pavlov comes from the [LZMA SDK](https://www.7-zip.org/sdk.html) (v19.00).  All the LZMA SDK is placed in the public domain: *"Anyone is free to copy, modify, publish, use, compile, sell, or distribute the original LZMA SDK code, either in source code form or as a compiled binary, for any purpose, commercial or non-commercial, and by any means."*

Lualzma is distributed under the terms of the MIT License. 
