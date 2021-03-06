Elm.Header = Elm.Header || {};
Elm.Header.make = function (elm)
                  {
                    elm.Header = elm.Header || {};
                    if (elm.Header.values)
                    return elm.Header.values;
                    var N = Elm.Native,
                        _N = N.Utils.make(elm),
                        _L = N.List.make(elm),
                        _E = N.Error.make(elm),
                        _J = N.JavaScript.make(elm),
                        $moduleName = "Header";
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
                    var Utils = Utils || {};
                    Utils.Rest = Elm.Utils.Rest.make(elm);
                    var _op = {};
                    var welcomeMessage = function ()
                                         {
                                           var txt = A3(Utils.Layout.headerGen,
                                                        100,
                                                        18,
                                                        Color.darkOrange);
                                           var msg = function (rsp)
                                                     {
                                                       return function ()
                                                              {
                                                                switch (rsp)
                                                                {case
                                                                 "" :
                                                                   return txt("~");
                                                                 case
                                                                 "guest" :
                                                                   return txt("please login");}
                                                                return txt(_L.append("welcome ",
                                                                                     rsp));
                                                              }();
                                                     };
                                           return A2(Signal._op["<~"],msg,Utils.Rest.helloUser);
                                         }();
                    var navigation = _J.toList([{ctor: "_Tuple2", _0: "/MakeAd.html", _1: "Create Ad"},
                                                {ctor: "_Tuple2", _0: "/php/findUserPosition.html", _1: "My Ads"},
                                                {ctor: "_Tuple2", _0: "/About.html", _1: "About"},
                                                {ctor: "_Tuple2", _0: "/php/php_cas.php", _1: "Login"},
                                                {ctor: "_Tuple2", _0: "/php/cas_logout.php", _1: "Logout"}]);
                    var navButtons = function ()
                                     {
                                       var navButton = function (arg0)
                                                       {
                                                         return function ()
                                                                {
                                                                  switch (arg0.ctor)
                                                                  {case
                                                                   "_Tuple2" :
                                                                     return Graphics.Element.link(arg0._0)(Utils.Layout.buttonGen(arg0._1));}
                                                                  _E.Case($moduleName,
                                                                          "on line 28, column 30 to 64");
                                                                }();
                                                       };
                                       return A2(List.map,navButton,navigation);
                                     }();
                    var navRow = function (w)
                                 {
                                   return function ()
                                          {
                                            var bar = A2(Graphics.Element.flow,
                                                         Graphics.Element.right,
                                                         navButtons);
                                            return A4(Graphics.Element.container,
                                                      w,
                                                      Graphics.Element.heightOf(bar),
                                                      Graphics.Element.middle,
                                                      bar);
                                          }();
                                 };
                    var title = F2(function (w,msg)
                                   {
                                     return function ()
                                            {
                                              var underLine = Graphics.Element.color(Color.darkOrange)(A2(Graphics.Element.spacer,
                                                                                                          w,
                                                                                                          2));
                                              var h = Basics.toFloat(A2(Basics.max,
                                                                        30,
                                                                        Basics.round(Basics.toFloat(w) / 20)));
                                              var hdr = Graphics.Element.link("/")(A4(Utils.Layout.headerGen,
                                                                                      w,
                                                                                      h,
                                                                                      Color.darkOrange,
                                                                                      "local-liquidator"));
                                              return Graphics.Element.layers(_J.toList([msg,
                                                                                        A2(Graphics.Element.flow,
                                                                                           Graphics.Element.down,
                                                                                           _J.toList([hdr,
                                                                                                      navRow(w),
                                                                                                      underLine]))]));
                                            }();
                                   });
                    var main = A2(Signal._op["~"],
                                  A2(Signal._op["<~"],title,Window.width),
                                  welcomeMessage);
                    elm.Header.values = {_op: _op, title: title, welcomeMessage: welcomeMessage, navigation: navigation, navButtons: navButtons, navRow: navRow, main: main};
                    return elm.Header.values;
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
                        };Elm.Utils = Elm.Utils || {};
Elm.Utils.Rest = Elm.Utils.Rest || {};
Elm.Utils.Rest.make = function (elm)
                      {
                        elm.Utils = elm.Utils || {};
                        elm.Utils.Rest = elm.Utils.Rest || {};
                        if (elm.Utils.Rest.values)
                        return elm.Utils.Rest.values;
                        var N = Elm.Native,
                            _N = N.Utils.make(elm),
                            _L = N.List.make(elm),
                            _E = N.Error.make(elm),
                            _J = N.JavaScript.make(elm),
                            $moduleName = "Utils.Rest";
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
                        var Http = Elm.Http.make(elm);
                        var JavaScript = JavaScript || {};
                        JavaScript.Experimental = Elm.JavaScript.Experimental.make(elm);
                        var Json = Elm.Json.make(elm);
                        var Maybe = Elm.Maybe.make(elm);
                        var _op = {};
                        var stringy = F2(function (req,accs)
                                         {
                                           return function ()
                                                  {
                                                    var partOf = F2(function (str,portion)
                                                                    {
                                                                      return function ()
                                                                             {
                                                                               var stringToRecord = function (str)
                                                                                                    {
                                                                                                      return function ()
                                                                                                             {
                                                                                                               var _case0 = Json.fromString(str);
                                                                                                               switch (_case0.ctor)
                                                                                                               {case
                                                                                                                "Just" :
                                                                                                                  return Maybe.Just(JavaScript.Experimental.toRecord(Json.toJSObject(_case0._0)));
                                                                                                                case
                                                                                                                "Nothing" :
                                                                                                                  return Maybe.Nothing;}
                                                                                                               _E.Case($moduleName,
                                                                                                                       "between lines 41 and 44");
                                                                                                             }();
                                                                                                    };
                                                                               return A3(Maybe.maybe,
                                                                                         "",
                                                                                         portion,
                                                                                         stringToRecord(str));
                                                                             }();
                                                                    });
                                                    var disassemble = function (str)
                                                                      {
                                                                        return A2(List.map,
                                                                                  partOf(str),
                                                                                  accs);
                                                                      };
                                                    var recordToString = function (response)
                                                                         {
                                                                           return function ()
                                                                                  {
                                                                                    switch (response.ctor)
                                                                                    {case
                                                                                     "Failure" :
                                                                                       return _J.toList([""]);
                                                                                     case
                                                                                     "Success" :
                                                                                       return disassemble(response._0);
                                                                                     case
                                                                                     "Waiting" :
                                                                                       return _J.toList(["waiting"]);}
                                                                                    _E.Case($moduleName,
                                                                                            "between lines 35 and 39");
                                                                                  }();
                                                                         };
                                                    return A2(Signal._op["<~"],
                                                              recordToString,
                                                              Http.sendGet(req));
                                                  }();
                                         });
                        var stringToRecord = function (str)
                                             {
                                               return function ()
                                                      {
                                                        var _case6 = Json.fromString(str);
                                                        switch (_case6.ctor)
                                                        {case
                                                         "Just" :
                                                           return Maybe.Just(JavaScript.Experimental.toRecord(Json.toJSObject(_case6._0)));
                                                         case
                                                         "Nothing" :
                                                           return Maybe.Nothing;}
                                                        _E.Case($moduleName,
                                                                "between lines 26 and 28");
                                                      }();
                                             };
                        var singleGet = function (r)
                                        {
                                          return Http.sendGet(Signal.dropRepeats(r));
                                        };
                        var sendReq = function (str)
                                      {
                                        return Http.send(A2(Signal._op["<~"],
                                                            function (r)
                                                            {
                                                              return A2(Http.post,r,"");
                                                            },
                                                            str));
                                      };
                        var scriptSrc = Signal.constant("/php/getUser.php");
                        var prettyPrint = function (res)
                                          {
                                            return function ()
                                                   {
                                                     switch (res.ctor)
                                                     {case
                                                      "Failure" :
                                                        return "";
                                                      case
                                                      "Success" :
                                                        return res._0;
                                                      case
                                                      "Waiting" :
                                                        return "";}
                                                     _E.Case($moduleName,"between lines 20 and 23");
                                                   }();
                                          };
                        var helloUser = A2(Signal._op["<~"],
                                           prettyPrint,
                                           sendReq(scriptSrc));
                        elm.Utils.Rest.values = {_op: _op, singleGet: singleGet, sendReq: sendReq, scriptSrc: scriptSrc, helloUser: helloUser, prettyPrint: prettyPrint, stringToRecord: stringToRecord, stringy: stringy};
                        return elm.Utils.Rest.values;
                      };