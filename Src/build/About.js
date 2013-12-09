Elm.About = Elm.About || {};
Elm.About.make = function (elm)
                 {
                   elm.About = elm.About || {};
                   if (elm.About.values)
                   return elm.About.values;
                   var N = Elm.Native,
                       _N = N.Utils.make(elm),
                       _L = N.List.make(elm),
                       _E = N.Error.make(elm),
                       _J = N.JavaScript.make(elm),
                       $moduleName = "About";
                   var Text = Elm.Text.make(elm);
                   var Text = Elm.Text.make(elm);
                   var Basics = Elm.Basics.make(elm);
                   var Signal = Elm.Signal.make(elm);
                   var List = Elm.List.make(elm);
                   var Maybe = Elm.Maybe.make(elm);
                   var Time = Elm.Time.make(elm);
                   var Prelude = Elm.Prelude.make(elm);
                   var Graphics = Graphics || {};
                   Graphics.Element = Elm.Graphics.Element.make(elm);
                   var Color = Elm.Color.make(elm);
                   var Graphics = Graphics || {};
                   Graphics.Collage = Elm.Graphics.Collage.make(elm);
                   var Window = Elm.Window.make(elm);
                   var Utils = Utils || {};
                   Utils.Layout = Elm.Utils.Layout.make(elm);
                   var _op = {};
                   var prettyHeader = function (w)
                                      {
                                        return A3(Utils.Layout.headerGen,w,29,Color.darkOrange);
                                      };
                   var md = function (arg0)
                            {
                              return function ()
                                     {
                                       switch (arg0.ctor)
                                       {case
                                        "_Tuple2" :
                                          return function ()
                                                 {
                                                   var w$ = List.maximum(_J.toList([Basics.round(Basics.toFloat(arg0._0) * 0.8),
                                                                                    400]));
                                                   var pics = function ()
                                                              {
                                                                var imageWidth = (w$ / 3 | 0) - 10;
                                                                var imageHeight = Basics.round(Basics.toFloat(imageWidth) * 3 / 4);
                                                                return Graphics.Element.flow(Graphics.Element.right)(A2(List.map,
                                                                                                                        function (n)
                                                                                                                        {
                                                                                                                          return A3(Graphics.Element.fittedImage,
                                                                                                                                    imageWidth,
                                                                                                                                    imageHeight,
                                                                                                                                    n);
                                                                                                                        },
                                                                                                                        _J.toList(["/images/cover.JPG",
                                                                                                                                   "/images/backCover.JPG",
                                                                                                                                   "/images/closeUp.JPG"])));
                                                              }();
                                                   var md3 = Text.text("<div style=\"height:0;width:0;\">&nbsp;</div><p>Your books ISBN number is commonly be found on the back of the book above the barcode.</p><div style=\"height:0;width:0;\">&nbsp;</div>");
                                                   var md2 = Text.text("<div style=\"height:0;width:0;\">&nbsp;</div><ul>\n<li>First, login with your IUPUI student username and password</li>\n<li>then you can Sell/Buy your textbooks now!</li>\n</ul>\n<p>To Sell Back Your Book and get top Textbook Buyback Prices, enter the ISBN of the textbooks (either 10 or 13) you wish to sell and click the Sell button! Students and Professors can get the most bargain for their textbooks on Local-Liquidator any time! Also if you want to buy textbook all you need to do is search for the textbook with it ISBN then click on the Buy button! Sell your textbooks, get paid immediately, its just that simple! Did you know that if you wait to sell your textbooks until the following semester, they may be worthless? Publishers frequently publish new editions of textbooks and when your book becomes the \'old edition\' it loses a lot of value. Do not let this happen to you, sell your textbooks today!</p><div style=\"height:0;width:0;\">&nbsp;</div>");
                                                   var md1 = Text.text("<div style=\"height:0;width:0;\">&nbsp;</div><p>Even when you buy used college books from the store you know they cost way too much! And to add insult to injury when you go to sell back college books to the bookstore they want to offer you mere pennies for your college textbooks. Well now you do not have to take this abuse anymore. Do you know you can Sell Back Your Book yourself to make sure you get the most for your college textbooks on campus? But how can you locate those who need you textbooks? That is where we come in, to solve this problem for you and everyone around you by starting Local-Liquidator on campus.</p><div style=\"height:0;width:0;\">&nbsp;</div>");
                                                   var heading3 = A2(prettyHeader,
                                                                     w$,
                                                                     "Where is the ISBN?");
                                                   var heading2 = A2(prettyHeader,
                                                                     w$,
                                                                     "How It Works");
                                                   var heading1 = A2(prettyHeader,
                                                                     w$,
                                                                     "The Textbook Solution");
                                                   var elements = Graphics.Element.flow(Graphics.Element.down)(A2(List.map,
                                                                                                                  function (n)
                                                                                                                  {
                                                                                                                    return A2(Graphics.Element.width,
                                                                                                                              w$,
                                                                                                                              n);
                                                                                                                  },
                                                                                                                  _J.toList([heading1,
                                                                                                                             md1,
                                                                                                                             heading2,
                                                                                                                             md2,
                                                                                                                             heading3,
                                                                                                                             pics])));
                                                   var h$ = Graphics.Element.heightOf(elements);
                                                   return A4(Graphics.Element.container,
                                                             arg0._0,
                                                             h$,
                                                             Graphics.Element.midTop,
                                                             elements);
                                                 }();}
                                       _E.Case($moduleName,"between lines 8 and 54");
                                     }();
                            };
                   var main = A2(Signal._op["<~"],
                                 Graphics.Element.flow(Graphics.Element.down),
                                 Signal.combine(_J.toList([A2(Signal._op["<~"],
                                                              md,
                                                              Window.dimensions)])));
                   elm.About.values = {_op: _op, prettyHeader: prettyHeader, md: md, main: main};
                   return elm.About.values;
                 };Elm.Utils = Elm.Utils || {};
Elm.Utils.Layout = Elm.Utils.Layout || {};
Elm.Utils.Layout.make = function (elm)
                        {
                          elm.Utils = elm.Utils || {};
                          elm.Utils.Layout = elm.Utils.Layout || {};
                          if (elm.Utils.Layout.values)
                          return elm.Utils.Layout.values;
                          var N = Elm.Native,
                              _N = N.Utils.make(elm),
                              _L = N.List.make(elm),
                              _E = N.Error.make(elm),
                              _J = N.JavaScript.make(elm),
                              $moduleName = "Utils.Layout";
                          var Text = Elm.Text.make(elm);
                          var Text = Elm.Text.make(elm);
                          var Basics = Elm.Basics.make(elm);
                          var Signal = Elm.Signal.make(elm);
                          var List = Elm.List.make(elm);
                          var Maybe = Elm.Maybe.make(elm);
                          var Time = Elm.Time.make(elm);
                          var Prelude = Elm.Prelude.make(elm);
                          var Graphics = Graphics || {};
                          Graphics.Element = Elm.Graphics.Element.make(elm);
                          var Color = Elm.Color.make(elm);
                          var Graphics = Graphics || {};
                          Graphics.Collage = Elm.Graphics.Collage.make(elm);
                          var Graphics = Graphics || {};
                          Graphics.Input = Elm.Graphics.Input.make(elm);
                          var _op = {};
                          var rowHeight = 38;
                          var makerWidth = 280;
                          var inputColor = A4(Color.rgba,255,199,0,0.2);
                          var hr = Graphics.Element.color(Color.darkOrange)(A2(Graphics.Element.spacer,
                                                                               makerWidth,
                                                                               2));
                          var headerGen = F3(function (w,h,c)
                                             {
                                               return function ($)
                                                      {
                                                        return Graphics.Element.width(w)(Text.centered(Text.height(h)(Text.color(c)(Text.toText($)))));
                                                      };
                                             });
                          var heads = function (str)
                                      {
                                        return Signal.constant(A2(Graphics.Element.flow,
                                                                  Graphics.Element.down,
                                                                  _J.toList([A4(headerGen,
                                                                                makerWidth,
                                                                                28,
                                                                                Color.darkOrange,
                                                                                str),
                                                                             hr])));
                                      };
                          var halfWidth = makerWidth / 2 | 0;
                          var butn = Graphics.Input.customButtons("");
                          var buttonGen = function (str)
                                          {
                                            return function ()
                                                   {
                                                     var box = F2(function (c1,c2)
                                                                  {
                                                                    return function ()
                                                                           {
                                                                             var word = Graphics.Element.width(halfWidth)(Text.centered(Text.color(Color.darkRed)(Text.height(20)(Text.toText(str)))));
                                                                             var grad = A3(Color.linear,
                                                                                           {ctor: "_Tuple2", _0: 0, _1: 20},
                                                                                           {ctor: "_Tuple2", _0: 0, _1: -29},
                                                                                           _J.toList([{ctor: "_Tuple2", _0: 0, _1: c1},
                                                                                                      {ctor: "_Tuple2", _0: 1, _1: c2}]));
                                                                             var emptyBtn = Graphics.Collage.gradient(grad)(A2(Graphics.Collage.rect,
                                                                                                                               Basics.toFloat(halfWidth) - 2,
                                                                                                                               36));
                                                                             return A3(Graphics.Collage.collage,
                                                                                       halfWidth,
                                                                                       38,
                                                                                       _J.toList([emptyBtn,
                                                                                                  Graphics.Collage.toForm(word)]));
                                                                           }();
                                                                  });
                                                     return A4(butn.customButton,
                                                               str,
                                                               A2(box,
                                                                  Color.white,
                                                                  Color.lightOrange),
                                                               A2(box,Color.white,Color.darkOrange),
                                                               A2(box,Color.red,Color.lightOrange));
                                                   }();
                                          };
                          var borderWidth = List.maximum(_J.toList([makerWidth / 20 | 0,
                                                                    10]));
                          var leftWidth = (makerWidth / 3 | 0) - (borderWidth / 2 | 0);
                          var padding = A2(Graphics.Element.spacer,borderWidth,borderWidth);
                          var rightWidth = makerWidth - leftWidth - borderWidth;
                          var table = F2(function (a,b)
                                         {
                                           return function ()
                                                  {
                                                    var row = function (arg0)
                                                              {
                                                                return function ()
                                                                       {
                                                                         switch (arg0.ctor)
                                                                         {case
                                                                          "_Tuple2" :
                                                                            return A2(Graphics.Element.flow,
                                                                                      Graphics.Element.right,
                                                                                      _J.toList([arg0._0,
                                                                                                 padding,
                                                                                                 arg0._1]));}
                                                                         _E.Case($moduleName,
                                                                                 "on line 23, column 27 to 65");
                                                                       }();
                                                              };
                                                    var rightSide = A2(List.map,
                                                                       function (n)
                                                                       {
                                                                         return A3(Graphics.Element.container,
                                                                                   rightWidth,
                                                                                   rowHeight,
                                                                                   Graphics.Element.midLeft)(A2(Graphics.Element.width,
                                                                                                                rightWidth - 2,
                                                                                                                n));
                                                                       },
                                                                       b);
                                                    var leftSide = A2(List.map,
                                                                      function (n)
                                                                      {
                                                                        return A3(Graphics.Element.container,
                                                                                  leftWidth,
                                                                                  rowHeight,
                                                                                  Graphics.Element.midRight)(Text.plainText(n));
                                                                      },
                                                                      a);
                                                    return Graphics.Element.color(inputColor)(Graphics.Element.flow(Graphics.Element.down)(List.map(row)(A2(List.zip,
                                                                                                                                                            leftSide,
                                                                                                                                                            rightSide))));
                                                  }();
                                         });
                          elm.Utils.Layout.values = {_op: _op, makerWidth: makerWidth, halfWidth: halfWidth, leftWidth: leftWidth, rightWidth: rightWidth, borderWidth: borderWidth, rowHeight: rowHeight, inputColor: inputColor, padding: padding, hr: hr, heads: heads, table: table, headerGen: headerGen, butn: butn, buttonGen: buttonGen};
                          return elm.Utils.Layout.values;
                        };