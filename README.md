# 中国海洋大学硕士博士学位论文 LaTeX 模板
[![GitHub release](https://img.shields.io/github/release/ouc-ocean-group/oucthesis/all.svg)](https://github.com/ouc-ocean-group/oucthesis/releases/latest)
## 简介
本项目是信息科学与工程学院 [OceanGroup VisionLab](https://og.oucvision.top) 编写的中国海洋大学的硕博士学位论文 LaTeX 模板 oucthesis，按照最新版的
《[中国海洋大学研究生学位论文书写格式统一要求](http://grad.ouc.edu.cn/39/69/c1660a14697/page.psp)》
的要求编写，测试兼容最新版的 Texpad (Mac)、TexStudio、Overleaf。(2021年末)

对于硕士生，在作者毕业的那一年，查重归档等各个程序都要求提交Word版论文，现在的情况未知。博士的话据说信院等已经开始接受LaTex了。（2021年底）

**由于本校论文格式要求过于粗略，作者综合了之前师兄师姐的论文和官方要求，编写出此版本，请自行衡量承担使用风险。**

## 下载地址
GitHub Releases：https://github.com/ouc-ocean-group/oucthesis/releases

详细使用方法请见 `main.tex`

## 字数统计
本模版使用 `texcount` 进行字数统计。请保证 tex 文件名为 `main.tex`。在编译选项加上：

```
--shell-escape
```
比如 TexStudio 设置中需要填写：

```
xelatex.exe -synctex=1 -interaction=nonstopmode --shell-escape %.tex
```

Windows 用户如想使用字数统计，请先到 [http://strawberryperl.com/](http://strawberryperl.com/) 安装 Perl。

## Overleaf

请将编译器设置为 XeLaTex

## 遇到可能的问题

如果发现模板有问题，请按照以下步骤操作：

1. 阅读学校的标准，判断是否符合学校的要求；
2. 将 TeX 发行版和宏包升级到最新，并且将模板升级到 Github 上最新版本，查看问题是否已经修复；
3. 在 [GitHub Issues](https://github.com/ouc-ocean-group/oucthesis/issues)
中搜索该问题的关键词；
5. 在 [GitHub Issues](https://github.com/ouc-ocean-group/oucthesis/issues)
中提出新 issue，并回答以下问题：
    - 使用了什么版本的软件？
    - 具体的问题是什么？
    - 正确的结果应该是什么样的？
    - 是否应该附上相关源码或者截图？

如果导师或者院系在格式上有额外的要求，请将老师的邮件转发给模板作者。
作者会考虑增加接口以便修改格式。


## 鸣谢

感谢 [@USTCthesis](https://github.com/ustctug/ustcthesis), [@THUthesis](https://github.com/xueruini/thuthesis) 提供的诸多参考！
