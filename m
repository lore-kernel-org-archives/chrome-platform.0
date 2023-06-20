Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85C7111F
	for <chrome-platform@lists.linux.dev>; Tue, 20 Jun 2023 10:33:57 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 714775C021E;
	Tue, 20 Jun 2023 06:33:56 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Tue, 20 Jun 2023 06:33:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=readahead.eu; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1687257236; x=1687343636; bh=zO
	XYcZVf+5yuT50hS9bfHkI45EXhEZoIuSJ0xb9Z+m4=; b=cp0B0JGs/o3drJT1KO
	BDN+Ze2R4ya3/jdcVlP9s7DfF+Z2edOIlOxJ6WkR77U9/9rtQPPu7qRZ3yvJbH7m
	XlNGXK8a9W9PHgSzUFABmjVjj1Xj8FQjM4/cvYLy/Gvoz9pXqo8ffOBogCM4F5GY
	GFDHrt1dbxE2HTVPVtLQcGWmw1NE+KKJ1bh0jq2Um55cGy11oq+LEYC4isLA4i0/
	SxINll5FIQgAAJYOfvuBXPOpVuQecgzd9iNVcNgXk/zyCAH5MPjl3E4MAo8CHtPS
	zQSyjEPk3P5yseIRKXKKpZrxk4HQq79IjwID9pK1gnkm4BzMhZjK8U6CXlVer96t
	bj2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1687257236; x=1687343636; bh=zOXYcZVf+5yuT
	50hS9bfHkI45EXhEZoIuSJ0xb9Z+m4=; b=h054wRZTkTbXTGuGQmEmFTUVuGqCU
	2rqqy1xu1IJZhS5ZDy79vkJVC+LNpwD2lY4lrBq1xZjwgIECD24jVydN6E+/szHR
	tUgiyspQiDAYF0WxWOhvRNmd90X3738wNxlXEa1QtPd54hlouxINk7cZRgGHSdyC
	jHujodJ4aHj14mPOE/94BlHJlrf7WafQvu4JU9Q1IFi6FVyZlFy0tGaiy8x5MsS4
	dKs8/hwRFQj07B371j96nnlt4F4HkKlUzYHLJuxfKfdgpTUHQhw7PVx4vzu/4qQR
	soHd9uzbXj/WvmNoTOdGJvPQ3QEPeF/R20oFgKAZz7+FhoPc7OzSuoFdQ==
X-ME-Sender: <xms:lICRZG7LJiZVEg5Zz_o0UpqhozoY94whoTQ-RdsWVxc9uKlCdm424g>
    <xme:lICRZP6Np07i6mcdXdDRo9oO7Q23UFYC6eGSdjqtdKc26pImRTybmHYgLArFv93Rs
    hr7KteNPBWoNA1AHRY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeefhedgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedfffgr
    vhhiugcutfhhvghinhhssggvrhhgfdcuoegurghvihgusehrvggruggrhhgvrggurdgvuh
    eqnecuggftrfgrthhtvghrnhepfeelgeeuheeihfeuleefleehtdektdeihffguddvheef
    iefhveelhedvvdfhueeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepuggrvhhiugesrhgvrggurghhvggrugdrvghu
X-ME-Proxy: <xmx:lICRZFcBcijURljXRdRVka6bT1L73Yl3jA7umrKt39-7svN3ARmeuw>
    <xmx:lICRZDIo1pgLg32Qkff_9QmLon9uE9YYZzw3vCuWNmjqoS5V3Tp4gg>
    <xmx:lICRZKLNpyH3RK6Cr5iIJecx4b_QCpXSieaHHiF4a6pCpxnKouW_Yg>
    <xmx:lICRZMhHI68fJU8JEtaPciJg24EHmy_BwGlqakYpgOQbrpi2tHEKnA>
Feedback-ID: id2994666:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 10D331700096; Tue, 20 Jun 2023 06:33:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-496-g8c46984af0-fm-20230615.001-g8c46984a
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <cf191201-b6b9-4ded-8d32-c77f3d27e38d@app.fastmail.com>
In-Reply-To: <ZJF3EocB7DX/ULxT@google.com>
References: <33c2d66a-84ad-48dd-b8ba-f88a7a68a0fd@app.fastmail.com>
 <ZJF3EocB7DX/ULxT@google.com>
Date: Tue, 20 Jun 2023 12:33:35 +0200
From: "David Rheinsberg" <david@readahead.eu>
To: "Tzung-Bi Shih" <tzungbi@kernel.org>
Cc: chrome-platform@lists.linux.dev, "Benson Leung" <bleung@chromium.org>,
 "Guenter Roeck" <groeck@chromium.org>
Subject: Re: cros_ec_lpcs on framework: packet too long (4 bytes, expected 0)
Content-Type: text/plain

Hi

On Tue, Jun 20, 2023, at 11:53 AM, Tzung-Bi Shih wrote:
> On Tue, Jun 20, 2023 at 10:12:34AM +0200, David Rheinsberg wrote:
>> Using the cros-ec over lpc device on the Framework-13, I occasionally get:
>> 
>>     cros_ec_lpcs cros_ec_lpcs.0: packet too long (4 bytes, expected 0)
>> 
>> Afterwards, the entire EC seems to be inactive and none of its controllers work, anymore (temperature sensors are stale, keyboard defunct, etc.). A reboot fixes the issues.
>
> To be clear, does an AP reboot fix the issue?  Or does it need an EC reboot?
> Will it trigger some watchdog mechanisms and thus a reboot after waiting for
> a specific duration (e.g. 30 seconds)?

A linux system reboot fixed the issue. I did *NOT* perform a cold-boot or explicitly rebooted the EC. If the EC is not automatically rebooted with the AP, then no EC-reboot was necessary to fix the issue.

No watchdog mechanism was triggered. Logs show I waited for 30min.

>> I cannot trigger this issue reliably, yet it seems to happen exclusively under heavy load. Do you have any recommendations how to debug this further?
>> 
>> I failed tracing where the error happens and why any further functionality of the EC is disabled thereafter. Does the driver end communication on an error? Or is this likely a firmware issue and just indicative of the firmware failing?
>> 
>> If you have any recommendations how to enabled the cros-tracing/debug features, I'd gladly run a custom kernel for a while to see where the failure originates.
>
> Could you get the AP and EC console log?  AFAIK, the "packet too long" is only
> indicating an error of the EC command.  There should be some other error
> messages directly related to the system becomes inactive.

There is nothing in the kernel logs besides the mentioned message +-30min of the occurrence. I did not enable debug-level messages, though.

> Try to get the consoles would be the most directly helpful.  Except the logs,
> ramoops, and stacktraces, for example, if the console is still available when
> the issue happens, you could use SysRq to get all stack backtraces.

The system is (almost) fully operational when the issue happens. It is just that some hardware features do not work, anymore. I noticed the temperature sensors reporting stale data and the `fn`-key having no effect anymore.

The kernel log was quiet around the time the issue started, except for the mentioned message.

Is there a particular kernel thread you would like to see the stacktrace for? I can dump the full system stack trace and see whether anything looks particularly weird. But given that normal system operation was not interrupted, I am unsure that I will find anything.

I am unsure which device driver triggered the ec-lpc transaction, but it did not show any further error message. I am not even sure whether it is pkg-xfer or cmd-xfer, since both use the same error message. I can try placing an ftrace marker in the error-path and hopefully get a kernel stacktrace of the error?

Can I use the chardev to test whether the ec-driver is still responsive?

If you insist, I can provide the full kernel-log. I will also try to fetch a sysrq stacktrace dump next time I trigger it.

Thanks a lot for helping!
David
