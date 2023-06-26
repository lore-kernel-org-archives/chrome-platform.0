Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C258F6B
	for <chrome-platform@lists.linux.dev>; Mon, 26 Jun 2023 13:10:10 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 97A455C0062;
	Mon, 26 Jun 2023 09:10:09 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Mon, 26 Jun 2023 09:10:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=readahead.eu; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1687785009; x=1687871409; bh=iy
	mi05GbVBFpvJl7+Em1IT5fbObjZslWbT88rxik6ZU=; b=Goa70QTVhIakM5OTX+
	OnOnCCB2hEbbrM1XU8/mk+e3DrX55fudGYg6I5CdXUCNs7XXgZ3T54ew8Mi+qGFf
	T5hVuRJ/ZuL8W4CpmiIuaPD7N8IpvEDF6fctbEVGXQ5rwA2b71qBfoOMlgs2Xozf
	hDpMUAfDM+ftGrEOWSMpAPCeRWzhg5Zw6wSD2fer+RSu8AA06I7VPbc2vPoqqaqq
	aM8fcuIvj5e5skRUZCyIm4cVrsd+JtYBkJIo+FUBg7Ss6SgwqRo7l902yKivMGl5
	wJFG7ULBxayJS5i2Ua+RcXXZqHzw8aCgq2wQ0VLxkOtZFiFoxLBXUWnQrnc5o1KJ
	dSYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1687785009; x=1687871409; bh=iymi05GbVBFpv
	Jl7+Em1IT5fbObjZslWbT88rxik6ZU=; b=N64/3YTDyuKWNpZYcJSKutrUcVwPR
	7XIfAlOR2gIQxM1Q6AGVG45mPQHFlsBkyK4u8HXo+CFO0Xo4uzXjhnbOZtL5watM
	HR2KI2iowjP8BDhdQd5IyrrrVKtPNL/ii3SK5kyLNrXRoUtLnxKOjZQgJCD+zHVa
	EyapPKm6GH1ENF9up2D89tSnV3DQeMluRtRtuqOfVMTjAq8NEL5SM1pXz5DwPKHd
	vyKPa0UgftQeWEkALxiCsv/I4/dzymrCulspreZWwWhEm9oBOYXVErFoIzyvOWIz
	s+1qpIDTjfoSd7J5i48J9M8RE0OP6jw2JPAfb3JelwZJvalIVjF8KmkQw==
X-ME-Sender: <xms:MY6ZZEeCpxlcb-nOaqSAPzSUbimoXAjioM5Q9-RMaSe5UT7nZV9BFg>
    <xme:MY6ZZGNeyF4-QRBZ6M3NsGhnaF69WAd6Oc3XVZMsPCIPJTBDLgDzQ3_YDK9gAEI-F
    To-xR1pBYihNudWZio>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeehfedgheejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedfffgr
    vhhiugcutfhhvghinhhssggvrhhgfdcuoegurghvihgusehrvggruggrhhgvrggurdgvuh
    eqnecuggftrfgrthhtvghrnhepfeelgeeuheeihfeuleefleehtdektdeihffguddvheef
    iefhveelhedvvdfhueeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepuggrvhhiugesrhgvrggurghhvggrugdrvghu
X-ME-Proxy: <xmx:MY6ZZFh6wTQO1HM9OrelGDyDriHp_AYyCZVuqOin-OYLUTnENnNpTA>
    <xmx:MY6ZZJ-TT6ju8vCSmrBAjGD-qNZDYL7BQA02RWSug7E8wmFzqHWMKw>
    <xmx:MY6ZZAt5Wl28KWvWIG2XQk4IwS6YyaXcyTpY8cnNIq6TCop2VtLqug>
    <xmx:MY6ZZNXTQ1E7DP6iHn_d7_QHLUZyzZAlxH9F8TvjhP-SX3CtZLpU9Q>
Feedback-ID: id2994666:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 2875D1700089; Mon, 26 Jun 2023 09:10:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-499-gf27bbf33e2-fm-20230619.001-gf27bbf33
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <5660de51-f6f3-4e13-84e6-5dbece011fe2@app.fastmail.com>
In-Reply-To: <ZJKDRkNrju92QzsZ@google.com>
References: <33c2d66a-84ad-48dd-b8ba-f88a7a68a0fd@app.fastmail.com>
 <ZJF3EocB7DX/ULxT@google.com>
 <cf191201-b6b9-4ded-8d32-c77f3d27e38d@app.fastmail.com>
 <ZJKDRkNrju92QzsZ@google.com>
Date: Mon, 26 Jun 2023 15:09:34 +0200
From: "David Rheinsberg" <david@readahead.eu>
To: "Tzung-Bi Shih" <tzungbi@kernel.org>
Cc: chrome-platform@lists.linux.dev, "Benson Leung" <bleung@chromium.org>,
 "Guenter Roeck" <groeck@chromium.org>
Subject: Re: cros_ec_lpcs on framework: packet too long (4 bytes, expected 0)
Content-Type: text/plain

Hi

On Wed, Jun 21, 2023, at 6:57 AM, Tzung-Bi Shih wrote:
>> There is nothing in the kernel logs besides the mentioned message +-30min of the occurrence. I did not enable debug-level messages, though.
>
> The issue you encountered should be at least an error.  I don't think it needs
> to enable debug-level messages to see other hints.
>
> Could you get EC console log?  Maybe there are some more hint messages.

Not sure what the "EC console log" is. Do you mean kmsgs from the cros-ec driver?

>> I am unsure which device driver triggered the ec-lpc transaction, but it did not show any further error message. I am not even sure whether it is pkg-xfer or cmd-xfer, since both use the same error message. I can try placing an ftrace marker in the error-path and hopefully get a kernel stacktrace of the error?
>
> `pkg_xfer` for protocol version 3; `cmd_xfer` for legacy.  In most cases, it
> should fall into protocol version 3.  I'm not sure if finding the device
> driver would be helpful.  The driver didn't print error messages as the driver
> doesn't think it was an error.

I wouldn't be too surprised if the error paths of the calling driver does not print anything on error. But it might not help much either way.

>> Can I use the chardev to test whether the ec-driver is still responsive?
>
> You can send hello message to EC via the chardev.  See [1] for reference.

Thanks, this is quite nice for debugging!

Given Dustin's comment, this seems like a known issue with the acpi tables accessing the same bus without a shared lock. This sounds like a plausible cause of the issue I am seeing. Lets see whether that leads us somewhere.

Thanks a lot for the hints!
David
