Elm.Main = Elm.Main || {};
Elm.Main.make = function (elm)
                {
                  elm.Main = elm.Main || {};
                  if (elm.Main.values)
                  return elm.Main.values;
                  var N = Elm.Native,
                      _N = N.Utils.make(elm),
                      _L = N.List.make(elm),
                      _E = N.Error.make(elm),
                      _J = N.JavaScript.make(elm),
                      $moduleName = "Main";
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
                  var Utils = Utils || {};
                  Utils.Header = Elm.Utils.Header.make(elm);
                  var Utils = Utils || {};
                  Utils.JConvert = Elm.Utils.JConvert.make(elm);
                  var Utils = Utils || {};
                  Utils.Inputs = Elm.Utils.Inputs.make(elm);
                  var _op = {};
                  var preview = function (url)
                                {
                                  return function ()
                                         {
                                           var redTitle = function (str)
                                                          {
                                                            return Graphics.Element.width(500)(Text.centered(Text.height(20)(Text.color(Color.darkYellow)(Text.toText(str)))));
                                                          };
                                           var scene = function (sig)
                                                       {
                                                         return A2(Graphics.Element.flow,
                                                                   Graphics.Element.down,
                                                                   _J.toList([redTitle("Ad Preview"),
                                                                              A2(Graphics.Element.flow,
                                                                                 Graphics.Element.down,
                                                                                 sig)]));
                                                       };
                                           var funcs = _J.toList([Text.plainText,
                                                                  function ($)
                                                                  {
                                                                    return Graphics.Element.width(400)(Text.plainText($));
                                                                  },
                                                                  A2(Graphics.Element.fittedImage,
                                                                     400,
                                                                     400)]);
                                           var caps = A2(List.map,
                                                         function ($)
                                                         {
                                                           return Graphics.Element.width(100)(Text.plainText($));
                                                         },
                                                         _J.toList(["Title",
                                                                    "Description",
                                                                    "Cover"]));
                                           var todos = function (str)
                                                       {
                                                         return A3(List.zipWith,
                                                                   Graphics.Element.beside,
                                                                   caps,
                                                                   A3(List.zipWith,
                                                                      F2(function (x,y)
                                                                         {
                                                                           return x(y);
                                                                         }),
                                                                      funcs,
                                                                      str));
                                                       };
                                           var accs = _J.toList([function (_)
                                                                 {
                                                                   return _.title;
                                                                 },
                                                                 function (_)
                                                                 {
                                                                   return _.description;
                                                                 },
                                                                 function (_)
                                                                 {
                                                                   return _.imageURL;
                                                                 }]);
                                           var results = A2(Utils.JConvert.stringy,url,accs);
                                           return A2(Signal._op["<~"],
                                                     scene,
                                                     A2(Signal._op["<~"],todos,results));
                                         }();
                                };
                  var content = F2(function (a,b)
                                   {
                                     return A2(Graphics.Element.flow,
                                               Graphics.Element.right,
                                               _J.toList([a,A2(Graphics.Element.spacer,10,10),b]));
                                   });
                  var main = A2(Signal._op["<~"],
                                Graphics.Element.flow(Graphics.Element.down),
                                Signal.combine(_J.toList([Utils.Header.hdr,
                                                          A2(Signal._op["~"],
                                                             A2(Signal._op["<~"],
                                                                content,
                                                                Utils.Inputs.controls),
                                                             preview(Utils.Inputs.urlString))])));
                  elm.Main.values = {_op: _op, preview: preview, content: content, main: main};
                  return elm.Main.values;
                };Elm.Utils = Elm.Utils || {};
Elm.Utils.Header = Elm.Utils.Header || {};
Elm.Utils.Header.make = function (elm)
                        {
                          elm.Utils = elm.Utils || {};
                          elm.Utils.Header = elm.Utils.Header || {};
                          if (elm.Utils.Header.values)
                          return elm.Utils.Header.values;
                          var N = Elm.Native,
                              _N = N.Utils.make(elm),
                              _L = N.List.make(elm),
                              _E = N.Error.make(elm),
                              _J = N.JavaScript.make(elm),
                              $moduleName = "Utils.Header";
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
                          Utils.HttpFunctions = Elm.Utils.HttpFunctions.make(elm);
                          var _op = {};
                          var topBarHeight = 20;
                          var scriptSrc = Signal.constant("/php/getUser.php");
                          var paths = _J.toList([{ctor: "_Tuple2", _0: "Home", _1: "/"},
                                                 {ctor: "_Tuple2", _0: "Login", _1: "/php/php_cas.php"},
                                                 {ctor: "_Tuple2", _0: "Logout", _1: "/php/cas_logout.php"},
                                                 {ctor: "_Tuple2", _0: "Send Ad (test)", _1: "/storeAdTest.html"},
                                                 {ctor: "_Tuple2", _0: "Add User (test)", _1: "/addUserTest.html"}]);
                          var navBar = function (arg0)
                                       {
                                         return function ()
                                                {
                                                  switch (arg0.ctor)
                                                  {case
                                                   "_Tuple2" :
                                                     return function ()
                                                            {
                                                              var words = A2(Graphics.Element.flow,
                                                                             Graphics.Element.right,
                                                                             _J.toList([A2(Graphics.Element.spacer,
                                                                                           10,
                                                                                           10),
                                                                                        Text.text(Text.link(arg0._1)(Text.toText(arg0._0))),
                                                                                        A2(Graphics.Element.spacer,
                                                                                           10,
                                                                                           10)]));
                                                              return A4(Graphics.Element.container,
                                                                        Graphics.Element.widthOf(words),
                                                                        topBarHeight,
                                                                        Graphics.Element.midRight,
                                                                        words);
                                                            }();}
                                                  _E.Case($moduleName,"between lines 36 and 41");
                                                }();
                                       };
                          var navs = Graphics.Element.flow(Graphics.Element.right)(A2(List.map,
                                                                                      navBar,
                                                                                      paths));
                          var logoHeight = 30;
                          var helloUser = A2(Signal._op["<~"],
                                             Utils.HttpFunctions.prettyPrint,
                                             A2(Utils.HttpFunctions.sendReq,scriptSrc,"post"));
                          var headerBuilder = F2(function (arg1,login)
                                                 {
                                                   return function ()
                                                          {
                                                            switch (arg1.ctor)
                                                            {case
                                                             "_Tuple2" :
                                                               return function ()
                                                                      {
                                                                        var welcome = function ()
                                                                                      {
                                                                                        switch (login)
                                                                                        {case
                                                                                         "" :
                                                                                           return Text.plainText("not logged in (404 error)");
                                                                                         case
                                                                                         "guest" :
                                                                                           return Text.plainText("Welcome Guest");
                                                                                         case
                                                                                         "waiting" :
                                                                                           return Text.plainText("waiting...");}
                                                                                        return Text.plainText(_L.append("Welcome, ",
                                                                                                                        login));
                                                                                      }();
                                                                        var title = Graphics.Element.width(arg1._0)(Text.centered(Text.color(Color.lightYellow)(Text.height(List.maximum(_J.toList([logoHeight,
                                                                                                                                                                                                    Basics.toFloat(arg1._0) / 20])))(Text.toText("Local Liquidator")))));
                                                                        return Graphics.Element.color(Color.lightBlue)(A2(Graphics.Element.flow,
                                                                                                                          Graphics.Element.down,
                                                                                                                          _J.toList([title,
                                                                                                                                     A2(Graphics.Element.flow,
                                                                                                                                        Graphics.Element.right,
                                                                                                                                        _J.toList([navs,
                                                                                                                                                   welcome])),
                                                                                                                                     Graphics.Element.color(Color.lightYellow)(A2(Graphics.Element.spacer,
                                                                                                                                                                                  arg1._0,
                                                                                                                                                                                  10))])));
                                                                      }();}
                                                            _E.Case($moduleName,
                                                                    "between lines 19 and 29");
                                                          }();
                                                 });
                          var hdr = A2(Signal._op["~"],
                                       A2(Signal._op["<~"],headerBuilder,Window.dimensions),
                                       helloUser);
                          elm.Utils.Header.values = {_op: _op, hdr: hdr};
                          return elm.Utils.Header.values;
                        };Elm.Utils = Elm.Utils || {};
Elm.Utils.Inputs = Elm.Utils.Inputs || {};
Elm.Utils.Inputs.make = function (elm)
                        {
                          elm.Utils = elm.Utils || {};
                          elm.Utils.Inputs = elm.Utils.Inputs || {};
                          if (elm.Utils.Inputs.values)
                          return elm.Utils.Inputs.values;
                          var N = Elm.Native,
                              _N = N.Utils.make(elm),
                              _L = N.List.make(elm),
                              _E = N.Error.make(elm),
                              _J = N.JavaScript.make(elm),
                              $moduleName = "Utils.Inputs";
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
                          Utils.HttpFunctions = Elm.Utils.HttpFunctions.make(elm);
                          var Utils = Utils || {};
                          Utils.Validation = Elm.Utils.Validation.make(elm);
                          var _op = {};
                          var url$ = "/php/checkISBN.php?isbn=";
                          var $ = Graphics.Input.button("Sell"),sell = $._0,sellEvent = $._1;
                          var $ = Graphics.Input.field("Price"),
                              price = $._0,
                              priceSignal = $._1;
                          var validPrice = A2(Signal._op["<~"],
                                              function (n)
                                              {
                                                return A2(Utils.Validation.validate,n,false);
                                              },
                                              priceSignal);
                          var $ = Graphics.Input.field("ISBN"),isbn = $._0,isbnSignal = $._1;
                          var validIsbn = A2(Signal._op["<~"],
                                             function (n)
                                             {
                                               return A2(Utils.Validation.validate,n,true);
                                             },
                                             isbnSignal);
                          var urlString = function ()
                                          {
                                            var queryString = function (s)
                                                              {
                                                                return function ()
                                                                       {
                                                                         switch (s)
                                                                         {case
                                                                          "" :
                                                                            return _L.append(url$,
                                                                                             "0");}
                                                                         return _L.append(url$,s);
                                                                       }();
                                                              };
                                            var srq = function (isbn)
                                                      {
                                                        return A2(Utils.HttpFunctions.sendReq,
                                                                  Signal.dropRepeats(A2(Signal._op["<~"],
                                                                                        queryString,
                                                                                        isbn)),
                                                                  "get");
                                                      };
                                            return A2(Signal._op["<~"],
                                                      Utils.HttpFunctions.prettyPrint,
                                                      srq(validIsbn));
                                          }();
                          var urlelem = A2(Signal._op["<~"],Text.plainText,validIsbn);
                          var $ = Graphics.Input.button("Buy"),buy = $._0,buyEvent = $._1;
                          var controls = function ()
                                         {
                                           var btngroup = Signal.constant(A2(Graphics.Element.flow,
                                                                             Graphics.Element.right,
                                                                             _J.toList([buy,
                                                                                        sell])));
                                           var arranged = F4(function (a,b,c,d)
                                                             {
                                                               return function ()
                                                                      {
                                                                        var w = List.maximum(A2(List.map,
                                                                                                Graphics.Element.widthOf,
                                                                                                _J.toList([a,
                                                                                                           b,
                                                                                                           c,
                                                                                                           d])));
                                                                        var title = Graphics.Element.width(200)(Text.centered(Text.height(20)(Text.color(Color.darkYellow)(Text.toText("Controls")))));
                                                                        var h = A2(List.foldr,
                                                                                   F2(function (x,y)
                                                                                      {
                                                                                        return x + y;
                                                                                      }),
                                                                                   0)(A2(List.map,
                                                                                         Graphics.Element.heightOf,
                                                                                         _J.toList([a,
                                                                                                    b,
                                                                                                    c,
                                                                                                    d])));
                                                                        var border = 10;
                                                                        return A2(Graphics.Element.flow,
                                                                                  Graphics.Element.down,
                                                                                  _J.toList([title,
                                                                                             Graphics.Element.color(Color.lightBlue)(A3(Graphics.Element.container,
                                                                                                                                        w + border,
                                                                                                                                        h + border,
                                                                                                                                        Graphics.Element.middle)(A2(Graphics.Element.flow,
                                                                                                                                                                    Graphics.Element.down,
                                                                                                                                                                    _J.toList([a,
                                                                                                                                                                               b,
                                                                                                                                                                               c,
                                                                                                                                                                               d]))))]));
                                                                      }();
                                                             });
                                           return A2(Signal._op["~"],
                                                     A2(Signal._op["~"],
                                                        A2(Signal._op["~"],
                                                           A2(Signal._op["<~"],arranged,isbn),
                                                           price),
                                                        btngroup),
                                                     urlelem);
                                         }();
                          elm.Utils.Inputs.values = {_op: _op, controls: controls, urlString: urlString};
                          return elm.Utils.Inputs.values;
                        };Elm.Utils = Elm.Utils || {};
Elm.Utils.HttpFunctions = Elm.Utils.HttpFunctions || {};
Elm.Utils.HttpFunctions.make = function (elm)
                               {
                                 elm.Utils = elm.Utils || {};
                                 elm.Utils.HttpFunctions = elm.Utils.HttpFunctions || {};
                                 if (elm.Utils.HttpFunctions.values)
                                 return elm.Utils.HttpFunctions.values;
                                 var N = Elm.Native,
                                     _N = N.Utils.make(elm),
                                     _L = N.List.make(elm),
                                     _E = N.Error.make(elm),
                                     _J = N.JavaScript.make(elm),
                                     $moduleName = "Utils.HttpFunctions";
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
                                 var _op = {};
                                 var sendReq = F2(function (str,method)
                                                  {
                                                    return function ()
                                                           {
                                                             switch (method)
                                                             {case
                                                              "get" :
                                                                return Http.sendGet(str);
                                                              case
                                                              "post" :
                                                                return Http.send(A2(Signal._op["<~"],
                                                                                    function (r)
                                                                                    {
                                                                                      return A2(Http.post,
                                                                                                r,
                                                                                                "");
                                                                                    },
                                                                                    str));}
                                                             _E.Case($moduleName,
                                                                     "between lines 9 and 11");
                                                           }();
                                                  });
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
                                                                 return "waiting";}
                                                              _E.Case($moduleName,
                                                                      "between lines 14 and 17");
                                                            }();
                                                   };
                                 elm.Utils.HttpFunctions.values = {_op: _op, prettyPrint: prettyPrint, sendReq: sendReq};
                                 return elm.Utils.HttpFunctions.values;
                               };Elm.Utils = Elm.Utils || {};
Elm.Utils.JConvert = Elm.Utils.JConvert || {};
Elm.Utils.JConvert.make = function (elm)
                          {
                            elm.Utils = elm.Utils || {};
                            elm.Utils.JConvert = elm.Utils.JConvert || {};
                            if (elm.Utils.JConvert.values)
                            return elm.Utils.JConvert.values;
                            var N = Elm.Native,
                                _N = N.Utils.make(elm),
                                _L = N.List.make(elm),
                                _E = N.Error.make(elm),
                                _J = N.JavaScript.make(elm),
                                $moduleName = "Utils.JConvert";
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
                            var Maybe = Elm.Maybe.make(elm);
                            var Json = Elm.Json.make(elm);
                            var JavaScript = JavaScript || {};
                            JavaScript.Experimental = Elm.JavaScript.Experimental.make(elm);
                            var _op = {};
                            var stringy = F2(function (req,accs)
                                             {
                                               return function ()
                                                      {
                                                        var responses = function (req)
                                                                        {
                                                                          return Http.sendGet(req);
                                                                        };
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
                                                                                                                           "between lines 20 and 23");
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
                                                                                      function (n)
                                                                                      {
                                                                                        return A2(partOf,
                                                                                                  str,
                                                                                                  n);
                                                                                      },
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
                                                                                                "between lines 14 and 18");
                                                                                      }();
                                                                             };
                                                        return A2(Signal._op["<~"],
                                                                  recordToString,
                                                                  responses(req));
                                                      }();
                                             });
                            elm.Utils.JConvert.values = {_op: _op, stringy: stringy};
                            return elm.Utils.JConvert.values;
                          };Elm.Utils = Elm.Utils || {};
Elm.Utils.Validation = Elm.Utils.Validation || {};
Elm.Utils.Validation.make = function (elm)
                            {
                              elm.Utils = elm.Utils || {};
                              elm.Utils.Validation = elm.Utils.Validation || {};
                              if (elm.Utils.Validation.values)
                              return elm.Utils.Validation.values;
                              var N = Elm.Native,
                                  _N = N.Utils.make(elm),
                                  _L = N.List.make(elm),
                                  _E = N.Error.make(elm),
                                  _J = N.JavaScript.make(elm),
                                  $moduleName = "Utils.Validation";
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
                              var _op = {};
                              var validate = F2(function (x,isIsbn)
                                                {
                                                  return function ()
                                                         {
                                                           switch (isIsbn)
                                                           {case
                                                            false :
                                                              return function ()
                                                                     {
                                                                       var _case1 = String.toFloat(x);
                                                                       switch (_case1.ctor)
                                                                       {case
                                                                        "Just" :
                                                                          return Prelude.show(_case1._0);
                                                                        case
                                                                        "Nothing" :
                                                                          return "";}
                                                                       _E.Case($moduleName,
                                                                               "between lines 9 and 11");
                                                                     }();
                                                            case
                                                            true :
                                                              return A2(String.all,
                                                                        Char.isDigit,
                                                                        x) && (_N.eq(String.length(x),
                                                                                     10) || _N.eq(String.length(x),
                                                                                                  13)) ? x : "";}
                                                           _E.Case($moduleName,
                                                                   "between lines 6 and 11");
                                                         }();
                                                });
                              elm.Utils.Validation.values = {_op: _op, validate: validate};
                              return elm.Utils.Validation.values;
                            };