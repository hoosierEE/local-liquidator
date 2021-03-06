Elm.MakeAd = Elm.MakeAd || {};
Elm.MakeAd.make = function (elm)
                  {
                    elm.MakeAd = elm.MakeAd || {};
                    if (elm.MakeAd.values)
                    return elm.MakeAd.values;
                    var N = Elm.Native,
                        _N = N.Utils.make(elm),
                        _L = N.List.make(elm),
                        _E = N.Error.make(elm),
                        _J = N.JavaScript.make(elm),
                        $moduleName = "MakeAd";
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
                    Utils.UserInput = Elm.Utils.UserInput.make(elm);
                    var Utils = Utils || {};
                    Utils.Rest = Elm.Utils.Rest.make(elm);
                    var Utils = Utils || {};
                    Utils.Layout = Elm.Utils.Layout.make(elm);
                    var _op = {};
                    var sendable = function ()
                                   {
                                     var vbtn = function (a)
                                                {
                                                  return function ()
                                                         {
                                                           switch (a)
                                                           {case
                                                            "" :
                                                              return false;}
                                                           return true;
                                                         }();
                                                };
                                     return A2(Signal._op["<~"],
                                               vbtn,
                                               function (_)
                                               {
                                                 return _.butn;
                                               }(Utils.UserInput.presentRec));
                                   }();
                    var isbnUrl = function (s)
                                  {
                                    return _L.append("/php/checkISBN.php?isbn=",s);
                                  };
                    var isbnPreview = A2(Signal._op["<~"],
                                         Utils.Rest.stringToRecord,
                                         A2(Signal._op["<~"],
                                            Utils.Rest.prettyPrint,
                                            Utils.Rest.singleGet(A2(Signal._op["<~"],
                                                                    isbnUrl,
                                                                    function (_)
                                                                    {
                                                                      return _.isbn;
                                                                    }(Utils.UserInput.presentRec)))));
                    var extractor = function (fld)
                                    {
                                      return function ()
                                             {
                                               var unrec = function (r)
                                                           {
                                                             return function ()
                                                                    {
                                                                      switch (r.ctor)
                                                                      {case
                                                                       "Just" :
                                                                         return fld(r._0);
                                                                       case
                                                                       "Nothing" :
                                                                         return "";}
                                                                      _E.Case($moduleName,
                                                                              "between lines 41 and 44");
                                                                    }();
                                                           };
                                               return A2(Signal._op["<~"],unrec,isbnPreview);
                                             }();
                                    };
                    var imager = extractor(function (_)
                                           {
                                             return _.imageURL;
                                           });
                    var display = F3(function (w,maker,preview)
                                     {
                                       return function ()
                                              {
                                                var underLine = Graphics.Element.color(Color.darkOrange)(A2(Graphics.Element.spacer,
                                                                                                            300,
                                                                                                            2));
                                                var previewTitle = A4(Utils.Layout.headerGen,
                                                                      300,
                                                                      28,
                                                                      Color.darkOrange,
                                                                      "Cover Preview");
                                                var previewSide = function (a)
                                                                  {
                                                                    return A2(Graphics.Element.flow,
                                                                              Graphics.Element.down,
                                                                              _J.toList([previewTitle,
                                                                                         underLine,
                                                                                         a]));
                                                                  };
                                                var bumper = A2(Graphics.Element.spacer,10,10);
                                                var stuffing = _J.toList([maker,
                                                                          bumper,
                                                                          previewSide(A3(Graphics.Element.image,
                                                                                         300,
                                                                                         400,
                                                                                         preview))]);
                                                var h = List.maximum(A2(List.map,
                                                                        Graphics.Element.heightOf,
                                                                        stuffing));
                                                return A3(Graphics.Element.container,
                                                          w,
                                                          h,
                                                          Graphics.Element.middle)(A2(Graphics.Element.flow,
                                                                                      Graphics.Element.right,
                                                                                      stuffing));
                                              }();
                                     });
                    var main = A2(Signal._op["~"],
                                  A2(Signal._op["~"],
                                     A2(Signal._op["<~"],display,Window.width),
                                     Utils.UserInput.adMaker),
                                  imager);
                    var adUrl = function ()
                                {
                                  var scriptPath = function (user)
                                                   {
                                                     return function (title)
                                                            {
                                                              return function (isbn10)
                                                                     {
                                                                       return function (isbn13)
                                                                              {
                                                                                return function (imageUrl)
                                                                                       {
                                                                                         return function (expTime)
                                                                                                {
                                                                                                  return function (description)
                                                                                                         {
                                                                                                           return function (condition)
                                                                                                                  {
                                                                                                                    return function (price)
                                                                                                                           {
                                                                                                                             return function (adType)
                                                                                                                                    {
                                                                                                                                      return function (lat)
                                                                                                                                             {
                                                                                                                                               return function (lon)
                                                                                                                                                      {
                                                                                                                                                        return _L.append("/php/storeAd.php?user=",
                                                                                                                                                                         _L.append(user,
                                                                                                                                                                                   _L.append("&Title=",
                                                                                                                                                                                             _L.append(title,
                                                                                                                                                                                                       _L.append("&ISBN10=",
                                                                                                                                                                                                                 _L.append(isbn10,
                                                                                                                                                                                                                           _L.append("&ISBN13=",
                                                                                                                                                                                                                                     _L.append(isbn13,
                                                                                                                                                                                                                                               _L.append("&imageURL=",
                                                                                                                                                                                                                                                         _L.append(imageUrl,
                                                                                                                                                                                                                                                                   _L.append("&ExpTime=",
                                                                                                                                                                                                                                                                             _L.append(expTime,
                                                                                                                                                                                                                                                                                       _L.append("&Description=",
                                                                                                                                                                                                                                                                                                 _L.append(description,
                                                                                                                                                                                                                                                                                                           _L.append("&Condition=",
                                                                                                                                                                                                                                                                                                                     _L.append("average",
                                                                                                                                                                                                                                                                                                                               _L.append("&Price=",
                                                                                                                                                                                                                                                                                                                                         _L.append(price,
                                                                                                                                                                                                                                                                                                                                                   _L.append("&Adtype=",
                                                                                                                                                                                                                                                                                                                                                             _L.append(adType,
                                                                                                                                                                                                                                                                                                                                                                       _L.append("&Lat=",
                                                                                                                                                                                                                                                                                                                                                                                 _L.append(lat,
                                                                                                                                                                                                                                                                                                                                                                                           _L.append("&Lon=",
                                                                                                                                                                                                                                                                                                                                                                                                     lon)))))))))))))))))))))));
                                                                                                                                                      };
                                                                                                                                             };
                                                                                                                                    };
                                                                                                                           };
                                                                                                                  };
                                                                                                         };
                                                                                                };
                                                                                       };
                                                                              };
                                                                     };
                                                            };
                                                   };
                                  return Utils.Rest.singleGet(A2(Signal.keepWhen,
                                                                 sendable,
                                                                 "")(A2(Signal._op["~"],
                                                                        A2(Signal._op["~"],
                                                                           A2(Signal._op["~"],
                                                                              A2(Signal._op["~"],
                                                                                 A2(Signal._op["~"],
                                                                                    A2(Signal._op["~"],
                                                                                       A2(Signal._op["~"],
                                                                                          A2(Signal._op["~"],
                                                                                             A2(Signal._op["~"],
                                                                                                A2(Signal._op["~"],
                                                                                                   A2(Signal._op["~"],
                                                                                                      A2(Signal._op["<~"],
                                                                                                         scriptPath,
                                                                                                         Utils.Rest.helloUser),
                                                                                                      extractor(function (_)
                                                                                                                {
                                                                                                                  return _.title;
                                                                                                                })),
                                                                                                   extractor(function (_)
                                                                                                             {
                                                                                                               return _.isbn;
                                                                                                             })),
                                                                                                extractor(function (_)
                                                                                                          {
                                                                                                            return _.isbn13;
                                                                                                          })),
                                                                                             extractor(function (_)
                                                                                                       {
                                                                                                         return _.imageURL;
                                                                                                       })),
                                                                                          function (_)
                                                                                          {
                                                                                            return _.expire;
                                                                                          }(Utils.UserInput.presentRec)),
                                                                                       extractor(function (_)
                                                                                                 {
                                                                                                   return _.description;
                                                                                                 })),
                                                                                    extractor(function (_)
                                                                                              {
                                                                                                return _.condition;
                                                                                              })),
                                                                                 function (_)
                                                                                 {
                                                                                   return _.price;
                                                                                 }(Utils.UserInput.presentRec)),
                                                                              function (_)
                                                                              {
                                                                                return _.butn;
                                                                              }(Utils.UserInput.presentRec)),
                                                                           function (_)
                                                                           {
                                                                             return _.lat;
                                                                           }(Utils.UserInput.presentRec)),
                                                                        function (_)
                                                                        {
                                                                          return _.lon;
                                                                        }(Utils.UserInput.presentRec))));
                                }();
                    elm.MakeAd.values = {_op: _op, isbnUrl: isbnUrl, isbnPreview: isbnPreview, sendable: sendable, adUrl: adUrl, extractor: extractor, imager: imager, display: display, main: main};
                    return elm.MakeAd.values;
                  };Elm.Utils = Elm.Utils || {};
Elm.Utils.UserInput = Elm.Utils.UserInput || {};
Elm.Utils.UserInput.make = function (elm)
                           {
                             elm.Utils = elm.Utils || {};
                             elm.Utils.UserInput = elm.Utils.UserInput || {};
                             if (elm.Utils.UserInput.values)
                             return elm.Utils.UserInput.values;
                             var N = Elm.Native,
                                 _N = N.Utils.make(elm),
                                 _L = N.List.make(elm),
                                 _E = N.Error.make(elm),
                                 _J = N.JavaScript.make(elm),
                                 $moduleName = "Utils.UserInput";
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
                             var Utils = Utils || {};
                             Utils.Valid = Elm.Utils.Valid.make(elm);
                             var Utils = Utils || {};
                             Utils.Layout = Elm.Utils.Layout.make(elm);
                             var JavaScript = Elm.JavaScript.make(elm);
                             var lats = Signal.constant(JavaScript.fromFloat(38.8));
                             document.addEventListener("latitude_" + elm.id,
                                                       function (e)
                                                       {
                                                         elm.notify(lats.id,e.value);
                                                       });
                             var lons = Signal.constant(JavaScript.fromFloat(-80.7));
                             document.addEventListener("longitude_" + elm.id,
                                                       function (e)
                                                       {
                                                         elm.notify(lons.id,e.value);
                                                       });
                             var _op = {};
                             var validSigRecord = {_: {}, butn: "", expire: "", isbn: "", lat: "", lon: "", price: ""};
                             var tableS = function ()
                                          {
                                            var inputTitles = _J.toList(["Isbn",
                                                                         "Price ($)",
                                                                         "Minutes"]);
                                            return Utils.Layout.table(inputTitles);
                                          }();
                             var sellBtn = Utils.Layout.buttonGen("sell");
                             var lons = Signal.constant(JavaScript.fromFloat(-80.7));
                             var lats = Signal.constant(JavaScript.fromFloat(38.8));
                             var flombine = function (n)
                                            {
                                              return A2(Signal._op["<~"],
                                                        Graphics.Element.flow(Graphics.Element.down),
                                                        Signal.combine(n));
                                            };
                             var buySell = Utils.Layout.butn;
                             var buyBtn = Utils.Layout.buttonGen("buy");
                             var $ = Graphics.Input.field("Price"),
                                 priceField = $._0,
                                 priceSignal = $._1;
                             var $ = Graphics.Input.field("ISBN Number"),
                                 isbnField = $._0,
                                 isbnSignal = $._1;
                             var $ = Graphics.Input.field("Expire (Minutes)"),
                                 expireField = $._0,
                                 expireSignal = $._1;
                             var validSignals = _J.toList([A2(Signal._op["<~"],
                                                              Utils.Valid.isbn,
                                                              isbnSignal),
                                                           A2(Signal._op["<~"],
                                                              Utils.Valid.price,
                                                              priceSignal),
                                                           A2(Signal._op["<~"],
                                                              Utils.Valid.expire,
                                                              expireSignal),
                                                           A2(Signal._op["<~"],
                                                              Utils.Valid.butn,
                                                              buySell.events)]);
                             var preview = Signal.combine(A2(List.map,
                                                             function (n)
                                                             {
                                                               return A2(Signal.lift,
                                                                         Text.plainText,
                                                                         n);
                                                             },
                                                             validSignals));
                             var adMaker = function ()
                                           {
                                             var previewArea = A2(Signal._op["<~"],tableS,preview);
                                             var outHeader = Utils.Layout.heads("Preview");
                                             var ins = Signal.combine(_J.toList([isbnField,
                                                                                 priceField,
                                                                                 expireField]));
                                             var inputHeader = Utils.Layout.heads("Create Ad");
                                             var inputArea = A2(Signal._op["<~"],tableS,ins);
                                             var btns = Signal.constant(A2(Graphics.Element.flow,
                                                                           Graphics.Element.right,
                                                                           _J.toList([buyBtn,
                                                                                      sellBtn])));
                                             return flombine(_J.toList([inputHeader,
                                                                        inputArea,
                                                                        btns,
                                                                        outHeader,
                                                                        previewArea]));
                                           }();
                             var whatsNew = function (rec)
                                            {
                                              return _N.replace([["isbn",
                                                                  A2(Signal.lift,
                                                                     Utils.Valid.isbn,
                                                                     isbnSignal)],
                                                                 ["price",
                                                                  A2(Signal.lift,
                                                                     Utils.Valid.price,
                                                                     priceSignal)],
                                                                 ["expire",
                                                                  A2(Signal.lift,
                                                                     Utils.Valid.expire,
                                                                     expireSignal)],
                                                                 ["butn",
                                                                  A2(Signal.lift,
                                                                     Utils.Valid.butn,
                                                                     buySell.events)],
                                                                 ["lat",
                                                                  A2(Signal.lift,
                                                                     Utils.Valid.latLon,
                                                                     lats)],
                                                                 ["lon",
                                                                  A2(Signal.lift,
                                                                     Utils.Valid.latLon,
                                                                     lons)]],
                                                                rec);
                                            };
                             var presentRec = whatsNew(validSigRecord);
                             elm.Utils.UserInput.values = {_op: _op, isbnField: isbnField, isbnSignal: isbnSignal, priceField: priceField, priceSignal: priceSignal, expireField: expireField, expireSignal: expireSignal, buyBtn: buyBtn, sellBtn: sellBtn, buySell: buySell, validSigRecord: validSigRecord, whatsNew: whatsNew, presentRec: presentRec, validSignals: validSignals, preview: preview, adMaker: adMaker, flombine: flombine, tableS: tableS};
                             return elm.Utils.UserInput.values;
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
                      };Elm.Utils = Elm.Utils || {};
Elm.Utils.Valid = Elm.Utils.Valid || {};
Elm.Utils.Valid.make = function (elm)
                       {
                         elm.Utils = elm.Utils || {};
                         elm.Utils.Valid = elm.Utils.Valid || {};
                         if (elm.Utils.Valid.values)
                         return elm.Utils.Valid.values;
                         var N = Elm.Native,
                             _N = N.Utils.make(elm),
                             _L = N.List.make(elm),
                             _E = N.Error.make(elm),
                             _J = N.JavaScript.make(elm),
                             $moduleName = "Utils.Valid";
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
                         var String = Elm.String.make(elm);
                         var Char = Elm.Char.make(elm);
                         var Maybe = Elm.Maybe.make(elm);
                         var JavaScript = Elm.JavaScript.make(elm);
                         var _op = {};
                         var price = function (str)
                                     {
                                       return function ()
                                              {
                                                var _case0 = String.toFloat(str);
                                                switch (_case0.ctor)
                                                {case
                                                 "Just" :
                                                   return function ()
                                                          {
                                                            var currency = function (s)
                                                                           {
                                                                             return Basics.toFloat(Basics.round(s * 100)) / 100;
                                                                           };
                                                            return Prelude.show(currency(_case0._0));
                                                          }();
                                                 case
                                                 "Nothing" :
                                                   return "0";}
                                                _E.Case($moduleName,"between lines 16 and 19");
                                              }();
                                     };
                         var latLon = function (flt)
                                      {
                                        return Prelude.show(flt);
                                      };
                         var isbn = function (str)
                                    {
                                      return function ()
                                             {
                                               var isbnDigits = A2(String.filter,Char.isDigit,str);
                                               var len = String.length(isbnDigits);
                                               return _N.eq(len,9) ? _L.append(isbnDigits,
                                                                               "X") : _N.eq(len,
                                                                                            10) || _N.eq(len,
                                                                                                         13) ? isbnDigits : "";
                                             }();
                                    };
                         var expire = function (str)
                                      {
                                        return function ()
                                               {
                                                 var maxTime = "10080";
                                                 var defaultTime = "60";
                                                 return function ()
                                                        {
                                                          var _case2 = String.toInt(str);
                                                          switch (_case2.ctor)
                                                          {case
                                                           "Just" :
                                                             return _N.cmp(_case2._0,
                                                                           0) > -1 && _N.cmp(_case2._0,
                                                                                             10080) < 1 ? Prelude.show(_case2._0) : _N.cmp(_case2._0,
                                                                                                                                           10080) > 0 ? maxTime : defaultTime;
                                                           case
                                                           "Nothing" :
                                                             return defaultTime;}
                                                          _E.Case($moduleName,
                                                                  "between lines 25 and 30");
                                                        }();
                                               }();
                                      };
                         var butn = function (btnName)
                                    {
                                      return btnName;
                                    };
                         elm.Utils.Valid.values = {_op: _op, isbn: isbn, price: price, expire: expire, butn: butn, latLon: latLon};
                         return elm.Utils.Valid.values;
                       };