Elm.AddUser = Elm.AddUser || {};
Elm.AddUser.make = function (elm)
                   {
                     elm.AddUser = elm.AddUser || {};
                     if (elm.AddUser.values)
                     return elm.AddUser.values;
                     var N = Elm.Native,
                         _N = N.Utils.make(elm),
                         _L = N.List.make(elm),
                         _E = N.Error.make(elm),
                         _J = N.JavaScript.make(elm),
                         $moduleName = "AddUser";
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
                     var Http = Elm.Http.make(elm);
                     var String = Elm.String.make(elm);
                     var Window = Elm.Window.make(elm);
                     var _op = {};
                     var url = F4(function (first,last,email,phone)
                                  {
                                    return _L.append("/php/storeUser.php?FirstName=",
                                                     _L.append(first,
                                                               _L.append("&LastName=",
                                                                         _L.append(last,
                                                                                   _L.append("&email=",
                                                                                             _L.append(email,
                                                                                                       _L.append("&phone=",
                                                                                                                 phone)))))));
                                  });
                     var showErrors = function (errs)
                                      {
                                        return List.isEmpty(errs) ? A2(Graphics.Element.spacer,
                                                                       10,
                                                                       10) : Graphics.Element.flow(Graphics.Element.down)(A2(List.map,
                                                                                                                             function ($)
                                                                                                                             {
                                                                                                                               return Text.text(Text.color(Color.red)(Text.toText($)));
                                                                                                                             },
                                                                                                                             errs));
                                      };
                     var scene = F3(function (arg2,box,result)
                                    {
                                      return function ()
                                             {
                                               switch (arg2.ctor)
                                               {case
                                                "_Tuple2" :
                                                  return A2(Graphics.Element.flow,
                                                            Graphics.Element.down,
                                                            _J.toList([A4(Graphics.Element.container,
                                                                          Graphics.Element.widthOf(box),
                                                                          Graphics.Element.heightOf(box),
                                                                          Graphics.Element.midTop,
                                                                          box),
                                                                       A4(Graphics.Element.container,
                                                                          Graphics.Element.widthOf(box),
                                                                          Graphics.Element.heightOf(result),
                                                                          Graphics.Element.midTop,
                                                                          result)]));}
                                               _E.Case($moduleName,"between lines 101 and 104");
                                             }();
                                    });
                     var rowHeight = 32;
                     var prettyPrint = function (res)
                                       {
                                         return function ()
                                                {
                                                  switch (res.ctor)
                                                  {case
                                                   "Failure" :
                                                     return Text.plainText("");
                                                   case
                                                   "Success" :
                                                     return Text.plainText(res._0);
                                                   case
                                                   "Waiting" :
                                                     return Text.plainText("");}
                                                  _E.Case($moduleName,"between lines 83 and 86");
                                                }();
                                       };
                     var getLogin = function (req)
                                    {
                                      return Http.send(A2(Signal.lift,
                                                          function (r)
                                                          {
                                                            return A2(Http.post,r,"");
                                                          },
                                                          req));
                                    };
                     var getErrors = F4(function (first,last,email,remail)
                                        {
                                          return Maybe.justs(A2(List.map,
                                                                function (arg0)
                                                                {
                                                                  return function ()
                                                                         {
                                                                           switch (arg0.ctor)
                                                                           {case
                                                                            "_Tuple2" :
                                                                              return arg0._0 ? Maybe.Just(arg0._1) : Maybe.Nothing;}
                                                                           _E.Case($moduleName,
                                                                                   "on line 13, column 31 to 64");
                                                                         }();
                                                                },
                                                                _J.toList([{ctor: "_Tuple2", _0: _N.eq(first,
                                                                                                       ""), _1: "First name required."},
                                                                           {ctor: "_Tuple2", _0: _N.eq(last,
                                                                                                       ""), _1: "Last name required."},
                                                                           {ctor: "_Tuple2", _0: _N.eq(email,
                                                                                                       ""), _1: "Must enter your email address."},
                                                                           {ctor: "_Tuple2", _0: _N.eq(remail,
                                                                                                       ""), _1: "Must re-enter your email address."},
                                                                           {ctor: "_Tuple2", _0: ! _N.eq(email,
                                                                                                         remail), _1: "Email addresses do not match."}])));
                                        });
                     var formTitle = function (str)
                                     {
                                       return Graphics.Element.width(400)(Text.centered(Text.height(38)(Text.toText(str))));
                                     };
                     var fieldWith = F2(function (txt,fld)
                                        {
                                          return A2(Graphics.Element.flow,
                                                    Graphics.Element.right,
                                                    _J.toList([A3(Graphics.Element.container,
                                                                  200,
                                                                  rowHeight,
                                                                  Graphics.Element.midRight)(Text.plainText(txt)),
                                                               A3(Graphics.Element.container,
                                                                  200,
                                                                  rowHeight,
                                                                  Graphics.Element.middle)(A3(Graphics.Element.size,
                                                                                              180,
                                                                                              26,
                                                                                              fld))]));
                                        });
                     var bgColor = A3(Color.rgb,230,230,230);
                     var $ = Graphics.Input.field("Re-enter Email"),
                         remailBox = $._0,
                         remail = $._1;
                     var $ = Graphics.Input.field("Phone Number"),
                         phoneBox = $._0,
                         phone = $._1;
                     var $ = Graphics.Input.field("Last Name"),
                         lastBox = $._0,
                         last = $._1;
                     var $ = Graphics.Input.field("First Name"),
                         firstBox = $._0,
                         first = $._1;
                     var $ = Graphics.Input.field("Your Email"),
                         emailBox = $._0,
                         email = $._1;
                     var $ = Graphics.Input.button("Submit"),butn = $._0,press = $._1;
                     var isClicked = function ()
                                     {
                                       var always = F2(function (value,signal)
                                                       {
                                                         return A2(Signal.lift,
                                                                   function (arg0)
                                                                   {
                                                                     return function ()
                                                                            {
                                                                              return value;
                                                                            }();
                                                                   },
                                                                   signal);
                                                       });
                                       return A2(Signal.merge,
                                                 A2(always,false,A2(Time.delay,0,press)),
                                                 A2(always,true,press));
                                     }();
                     var sendAttempt = A2(Signal.lift,
                                          function (c)
                                          {
                                            return _N.cmp(c,0) > 0;
                                          },
                                          Signal.count(press));
                     var errors = A3(Signal.keepWhen,
                                     sendAttempt,
                                     _J.toList([]),
                                     A5(Signal.lift4,getErrors,first,last,email,remail));
                     var sendable = A3(Signal.lift2,
                                       F2(function (x,y)
                                          {
                                            return x && y;
                                          }),
                                       isClicked,
                                       A2(Signal.lift,List.isEmpty,errors));
                     var sendRequest = A2(Signal.keepWhen,sendable,"0")(A5(Signal.lift4,
                                                                           url,
                                                                           first,
                                                                           last,
                                                                           email,
                                                                           phone));
                     var loginResponse = A2(Signal.lift,
                                            prettyPrint,
                                            getLogin(sendRequest));
                     var userEntry = F6(function (first,last,email,remail,phone,errors)
                                        {
                                          return Graphics.Element.color(bgColor)(Graphics.Element.flow(Graphics.Element.down)(_J.toList([formTitle("Add User"),
                                                                                                                                         A2(fieldWith,
                                                                                                                                            "First Name:",
                                                                                                                                            first),
                                                                                                                                         A2(fieldWith,
                                                                                                                                            "Last Name:",
                                                                                                                                            last),
                                                                                                                                         A2(fieldWith,
                                                                                                                                            "Your Email:",
                                                                                                                                            email),
                                                                                                                                         A2(fieldWith,
                                                                                                                                            "Re-enter Email:",
                                                                                                                                            remail),
                                                                                                                                         A2(fieldWith,
                                                                                                                                            "Phone Number:",
                                                                                                                                            phone),
                                                                                                                                         showErrors(errors),
                                                                                                                                         A3(Graphics.Element.container,
                                                                                                                                            390,
                                                                                                                                            50,
                                                                                                                                            Graphics.Element.midRight)(A3(Graphics.Element.size,
                                                                                                                                                                          60,
                                                                                                                                                                          30,
                                                                                                                                                                          butn))])));
                                        });
                     var inputForm = A2(Signal._op["~"],
                                        A2(Signal._op["~"],
                                           A2(Signal._op["~"],
                                              A2(Signal._op["~"],
                                                 A2(Signal._op["~"],
                                                    A2(Signal._op["<~"],userEntry,firstBox),
                                                    lastBox),
                                                 emailBox),
                                              remailBox),
                                           phoneBox),
                                        errors);
                     var inputBox = function ()
                                    {
                                      var w = A2(Signal.lift,Graphics.Element.widthOf,inputForm);
                                      var h = A2(Signal.lift,Graphics.Element.heightOf,inputForm);
                                      var cmaker = F3(function (inForm,bWidth,bHeight)
                                                      {
                                                        return A4(Graphics.Element.container,
                                                                  bWidth,
                                                                  bHeight,
                                                                  Graphics.Element.topLeft,
                                                                  inForm);
                                                      });
                                      return A2(Signal._op["~"],
                                                A2(Signal._op["~"],
                                                   A2(Signal._op["<~"],cmaker,inputForm),
                                                   w),
                                                h);
                                    }();
                     var main = A2(Signal._op["~"],
                                   A2(Signal._op["~"],
                                      A2(Signal._op["<~"],scene,Window.dimensions),
                                      inputBox),
                                   loginResponse);
                     elm.AddUser.values = {_op: _op, bgColor: bgColor, rowHeight: rowHeight, getErrors: getErrors, url: url, first: first, firstBox: firstBox, last: last, lastBox: lastBox, email: email, emailBox: emailBox, remail: remail, remailBox: remailBox, phone: phone, phoneBox: phoneBox, butn: butn, press: press, sendAttempt: sendAttempt, isClicked: isClicked, errors: errors, sendable: sendable, fieldWith: fieldWith, showErrors: showErrors, formTitle: formTitle, userEntry: userEntry, sendRequest: sendRequest, getLogin: getLogin, prettyPrint: prettyPrint, inputForm: inputForm, inputBox: inputBox, loginResponse: loginResponse, scene: scene, main: main};
                     return elm.AddUser.values;
                   };