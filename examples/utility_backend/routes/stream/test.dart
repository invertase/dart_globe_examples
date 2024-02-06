import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  return Response(
    body: '''
      <!DOCTYPE html>
<html>
	<head>
		<title>Utility Backend</title>
		<script>
			(function () {
				const t = document.createElement('link').relList;
				if (t && t.supports && t.supports('modulepreload')) return;
				for (const r of document.querySelectorAll('link[rel="modulepreload"]'))
					n(r);
				new MutationObserver((r) => {
					for (const i of r)
						if (i.type === 'childList')
							for (const s of i.addedNodes)
								s.tagName === 'LINK' && s.rel === 'modulepreload' && n(s);
				}).observe(document, { childList: !0, subtree: !0 });
				function o(r) {
					const i = {};
					return (
						r.integrity && (i.integrity = r.integrity),
						r.referrerPolicy && (i.referrerPolicy = r.referrerPolicy),
						r.crossOrigin === 'use-credentials'
							? (i.credentials = 'include')
							: r.crossOrigin === 'anonymous'
							? (i.credentials = 'omit')
							: (i.credentials = 'same-origin'),
						i
					);
				}
				function n(r) {
					if (r.ep) return;
					r.ep = !0;
					const i = o(r);
					fetch(r.href, i);
				}
			})();
			async function P(e, t) {
				const o = e.getReader();
				let n;
				for (; !(n = await o.read()).done; ) t(n.value);
			}
			function j(e) {
				let t,
					o,
					n,
					r = !1;
				return function (s) {
					t === void 0 ? ((t = s), (o = 0), (n = -1)) : (t = x(t, s));
					const a = t.length;
					let c = 0;
					for (; o < a; ) {
						r && (t[o] === 10 && (c = ++o), (r = !1));
						let l = -1;
						for (; o < a && l === -1; ++o)
							switch (t[o]) {
								case 58:
									n === -1 && (n = o - c);
									break;
								case 13:
									r = !0;
								case 10:
									l = o;
									break;
							}
						if (l === -1) break;
						e(t.subarray(c, l), n), (c = o), (n = -1);
					}
					c === a ? (t = void 0) : c !== 0 && ((t = t.subarray(c)), (o -= c));
				};
			}
			function S(e, t, o) {
				let n = L();
				const r = new TextDecoder();
				return function (s, a) {
					if (s.length === 0) o == null || o(n), (n = L());
					else if (a > 0) {
						const c = r.decode(s.subarray(0, a)),
							l = a + (s[a + 1] === 32 ? 2 : 1),
							u = r.decode(s.subarray(l));
						switch (c) {
							case 'data':
								n.data = n.data
									? n.data +
									  `
` +
									  u
									: u;
								break;
							case 'event':
								n.event = u;
								break;
							case 'id':
								e((n.id = u));
								break;
							case 'retry':
								const f = parseInt(u, 10);
								isNaN(f) || t((n.retry = f));
								break;
						}
					}
				};
			}
			function x(e, t) {
				const o = new Uint8Array(e.length + t.length);
				return o.set(e), o.set(t, e.length), o;
			}
			function L() {
				return { data: '', event: '', id: '', retry: void 0 };
			}
			var B = function (e, t) {
				var o = {};
				for (var n in e)
					Object.prototype.hasOwnProperty.call(e, n) &&
						t.indexOf(n) < 0 &&
						(o[n] = e[n]);
				if (e != null && typeof Object.getOwnPropertySymbols == 'function')
					for (
						var r = 0, n = Object.getOwnPropertySymbols(e);
						r < n.length;
						r++
					)
						t.indexOf(n[r]) < 0 &&
							Object.prototype.propertyIsEnumerable.call(e, n[r]) &&
							(o[n[r]] = e[n[r]]);
				return o;
			};
			const w = 'text/event-stream',
				M = 1e3,
				T = 'last-event-id';
			function N(e, t) {
				var {
						signal: o,
						headers: n,
						onopen: r,
						onmessage: i,
						onclose: s,
						onerror: a,
						openWhenHidden: c,
						fetch: l,
					} = t,
					u = B(t, [
						'signal',
						'headers',
						'onopen',
						'onmessage',
						'onclose',
						'onerror',
						'openWhenHidden',
						'fetch',
					]);
				return new Promise((f, I) => {
					const y = Object.assign({}, n);
					y.accept || (y.accept = w);
					let p;
					function O() {
						p.abort(), document.hidden || g();
					}
					c || document.addEventListener('visibilitychange', O);
					let E = M,
						m = 0;
					function h() {
						document.removeEventListener('visibilitychange', O),
							window.clearTimeout(m),
							p.abort();
					}
					o == null ||
						o.addEventListener('abort', () => {
							h(), f();
						});
					const C = l ?? window.fetch,
						H = r ?? A;
					async function g() {
						var b;
						p = new AbortController();
						try {
							const v = await C(
								e,
								Object.assign(Object.assign({}, u), {
									headers: y,
									signal: p.signal,
								})
							);
							await H(v),
								await P(
									v.body,
									j(
										S(
											(d) => {
												d ? (y[T] = d) : delete y[T];
											},
											(d) => {
												E = d;
											},
											i
										)
									)
								),
								s == null || s(),
								h(),
								f();
						} catch (v) {
							if (!p.signal.aborted)
								try {
									const d =
										(b = a == null ? void 0 : a(v)) !== null && b !== void 0
											? b
											: E;
									window.clearTimeout(m), (m = window.setTimeout(g, d));
								} catch (d) {
									h(), I(d);
								}
						}
					}
					g();
				});
			}
			function A(e) {
				const t = e.headers.get('content-type');
				if (!(t != null && t.startsWith(w)))
					throw new Error('Expected content-type to be ' + w + ' Actual: ' + t);
			}
			const k = async () => {
				await N('/stream', {
					method: 'GET',
					headers: { Accept: 'text/event-stream' },
					onopen(e) {
						e.ok && e.status === 200
							? (document.getElementById('event').innerHTML =
									'Connection made ' + e.status)
							: e.status >= 400 &&
							  e.status < 500 &&
							  e.status !== 429 &&
							  (document.getElementById('event').innerHTML =
									'Client side error  ' + e.status);
					},
					onmessage(e) {
						document.getElementById('event').innerHTML = e.data;
					},
					onclose() {
						document.getElementById('event').innerHTML =
							'Connection closed by the server';
					},
					onerror(e) {
						document.getElementById('event').innerHTML =
							'There was an error from server' +
							(e == null ? void 0 : e.message);
					},
				});
			};
			k();
		</script>
	</head>
	<body>
		<h1>Server Sent Event on Globe</h1>
		<div id="event"></div>
	</body>
</html>
''',
    headers: {
      'content-type': 'text/html; charset=utf-8',
    },
  );
}
