本ファイルは下記URLにて配布された[v2.7.4]KawaiiMaidModを
開発版にて動作出来るよう修正を加えたものです。

オリジナルファイル配布場所
https://drive.google.com/open?id=1EHPazdmx9to86IWN7zxkvFjPiUmsFGZl

変更箇所：
・開発版にて使用できなくなったlua関連のファイルを削除。
・メイド服LSS-PRO、ホワイトブリムLSS-PRO、ハイテク眼鏡にて、旧式の電池を必要としていたレシピを電池無しに改変。
・完成品の電池関係の記述を新仕様に改変、電池の消耗は温熱式バクラバと同等としました。
・ホワイトブリムLSS-PROの暖かさを若干調整しました
・MSX++DEAD_PEOPLEに加え、SomeDeadGuy氏の新タイルUNDEAD_PEOPLEに対応しました
　UNDEAD_PEOPLEダウンロードはこちら
　https://discourse.cataclysmdda.org/t/32x32-msx-dead-people-tileset/18775
・前提modだったHairs+(Hair aka Rainbow)をインストールせずに動作可能なようにしました
　開発版では髪型などの要素が既に取り込まれており、Hairs+を導入するとNPCの髪型がダブる等の弊害がありました
　これによりNPCの容姿はCute系とバニラで混在しなくなり、Cute系はCute系のみで構成された人種として出現します
・[使う]を利用した変形アイテムの修理難度が異様に高かったのを修正
・Lintを敢行(https://dev.narc.ro/cataclysm/format.html)
・開発版のインベントリ仕様変更に伴い、pocket_dataを大幅に追加
・夏が暑くなる開発版の気候を考慮し暖かさをほんの少し修正
・メイド服LSS-PROの暖かさを下方修正、また(空冷)にした際に周囲に冷気が発するようにしました
・おしゃれスカーフに不可視になる「しまい込み」を追加、おしゃれスカーフ(緩めた)を使用することで変化します
・メイド服EX、LSSメイド服にロングスカートバージョンを追加、通常版をクラフトすることでロングに出来ます
・ハードケース各種を内容量に応じて動作制限が変化するよう修正、また全般的に容量を調整
・作成可能な服に"VARSIZE"フラグを付与、これにより仕立て直しが可能になります


ライセンス：
本ファイルはオリジナルのreadmeに記載されたライセンスに基づき、CC BY-SA 3.0で配布させて頂いています。
ライセンスの詳細：http://creativecommons.org/licenses/by-sa/3.0/