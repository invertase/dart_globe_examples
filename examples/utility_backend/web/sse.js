import { fetchEventSource } from '@microsoft/fetch-event-source';

const fetchData = async () => {
	await fetchEventSource(`http://localhost:8080/stream`, {
		method: 'GET',
		headers: {
			Accept: 'text/event-stream',
		},
		onopen(res) {
			if (res.ok && res.status === 200) {
				document.getElementById('event').innerHTML =
					'Connection made ' + res.status;
			} else if (res.status >= 400 && res.status < 500 && res.status !== 429) {
				document.getElementById('event').innerHTML =
					'Client side error  ' + res.status;
			}
		},
		onmessage(event) {
			document.getElementById('event').innerHTML = event.data;
		},
		onclose() {
			document.getElementById('event').innerHTML =
				'Connection closed by the server';
		},
		onerror(err) {
			document.getElementById('event').innerHTML =
				'There was an error from server' + err?.message;
		},
	});
};
fetchData();
