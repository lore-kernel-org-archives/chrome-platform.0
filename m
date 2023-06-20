Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC34F9F0
	for <chrome-platform@lists.linux.dev>; Tue, 20 Jun 2023 09:53:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E50A0C433C9;
	Tue, 20 Jun 2023 09:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687254805;
	bh=It1ebMFrXQ+eYEE5XKXN70gwds+8llIfOMVbI7DYbpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UheygPMpq1XwzTbhzAZ4+0F5nBet590ZKZL6g8GpQLV1MqV5dGW5HdLbG3q1vKic1
	 Chtv4445OKpSJw1iaiuDGABnoctr48te262AaggVxVFlFYF8r9UftaWch5krc6onc1
	 MB5brIauROZ3vEgCj4KPxpu4m6XKSSR8zQ0yQwwds2rZqRtcgEcUTSPS+Ms+Xe629l
	 /DAmPF5fWhDtDB4b4WFnYcNwVkJUKqSxqy+0t/RDevuuxZvioAnVDXUhtQTZn/vyEl
	 rupdwoxwoU/iQ9dGebWFfEK+6Kehn5CWPiFdH67MBIzDlRRgAdawNphLQMbHFbRRDc
	 apEcSjbKQBBYg==
Date: Tue, 20 Jun 2023 17:53:22 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: David Rheinsberg <david@readahead.eu>
Cc: chrome-platform@lists.linux.dev, Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Subject: Re: cros_ec_lpcs on framework: packet too long (4 bytes, expected 0)
Message-ID: <ZJF3EocB7DX/ULxT@google.com>
References: <33c2d66a-84ad-48dd-b8ba-f88a7a68a0fd@app.fastmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33c2d66a-84ad-48dd-b8ba-f88a7a68a0fd@app.fastmail.com>

On Tue, Jun 20, 2023 at 10:12:34AM +0200, David Rheinsberg wrote:
> Using the cros-ec over lpc device on the Framework-13, I occasionally get:
> 
>     cros_ec_lpcs cros_ec_lpcs.0: packet too long (4 bytes, expected 0)
> 
> Afterwards, the entire EC seems to be inactive and none of its controllers work, anymore (temperature sensors are stale, keyboard defunct, etc.). A reboot fixes the issues.

To be clear, does an AP reboot fix the issue?  Or does it need an EC reboot?
Will it trigger some watchdog mechanisms and thus a reboot after waiting for
a specific duration (e.g. 30 seconds)?

> I cannot trigger this issue reliably, yet it seems to happen exclusively under heavy load. Do you have any recommendations how to debug this further?
> 
> I failed tracing where the error happens and why any further functionality of the EC is disabled thereafter. Does the driver end communication on an error? Or is this likely a firmware issue and just indicative of the firmware failing?
> 
> If you have any recommendations how to enabled the cros-tracing/debug features, I'd gladly run a custom kernel for a while to see where the failure originates.

Could you get the AP and EC console log?  AFAIK, the "packet too long" is only
indicating an error of the EC command.  There should be some other error
messages directly related to the system becomes inactive.

Try to get the consoles would be the most directly helpful.  Except the logs,
ramoops, and stacktraces, for example, if the console is still available when
the issue happens, you could use SysRq to get all stack backtraces.
