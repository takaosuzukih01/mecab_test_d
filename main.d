extern(C)
{
  struct mecab_t;

  mecab_t* mecab_new2(const(char)* arg);
  void mecab_destroy(mecab_t *mecab);
  const(char)* mecab_sparse_tostr(mecab_t *mecab, const(char)* str);
}

import std.stdio,
       std.string,
       std.conv,
       std.algorithm;

void main() {
  string input = "今日は良い天気だなあ。";

  auto mecab = mecab_new2("");
  scope(exit) mecab_destroy(mecab);

  auto result = mecab_sparse_tostr(mecab, input.toStringz);
  writeln(result.to!string);
}
