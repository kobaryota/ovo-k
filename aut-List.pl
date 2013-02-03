## *-draft.txt をそれぞれに追加して重複しているものがないようにするプログラム

#!/usr/bin/perl

system("cat /Users/ovo/OVO-AUTO/list/SourceList-draft.txt >>/Users/ovo/OVO-AUTO/list/SourceList2.txt");
system("sort /Users/ovo/OVO-AUTO/list/SourceList2.txt | uniq > /Users/ovo/OVO-AUTO/list/SourceList.txt");
system("cp /Users/ovo/OVO-AUTO/list/SourceList.txt /Users/ovo/OVO-AUTO/list/SourceList2.txt");
system("cat /Users/ovo/OVO-AUTO/list/NameList-draft.txt >> /Users/ovo/OVO-AUTO/list/NameList2.txt");
system("sort /Users/ovo/OVO-AUTO/list/NameList2.txt | uniq > /Users/ovo/OVO-AUTO/list/NameList.txt");
system("cp /Users/ovo/OVO-AUTO/list/NameList.txt /Users/ovo/OVO-AUTO/list/NameList2.txt");
