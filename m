Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8706393
	for <chrome-platform@lists.linux.dev>; Thu, 14 Dec 2023 03:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nC+RhMcT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19CCFC433C8;
	Thu, 14 Dec 2023 03:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702523384;
	bh=xzN8VBpaQ+C7FVjwAk3uk6XkuZkz8OK0t7++aNp/cIM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nC+RhMcTfI/6+5mFEnRMg0ZdIKa7dY0hlVas3wsZuOWL4dp4qkeELxPuR3z0z+M0w
	 XnLvoKtUCNSQbw8YLXWwmvhJLa7eb5rHfU+VXUd9Q+kVtosQ3yhZDlmAdwV2T5nMVV
	 6j0J2beZpq1bzBCSABWofyFdhI0wcbt/45kPk1Mdovuxj95c5YMMl/TswoWh/Pj89J
	 42aJkUJBMovQJzuZYkaWMG4/BtPiTozdNRA+n2YOyF2irlRvEehsr4gKR4zatKEYrQ
	 7DK91asMXsHWtdZSyOE6TwJZX53lZ1kPlpx3N5mcmtQvyd6N8QzPBuylQoPrVBPKgs
	 Fnf129/eaGwwg==
Date: Thu, 14 Dec 2023 11:09:41 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Mark Hasemeyer <markhas@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Raul Rangel <rrangel@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Bhanu Prakash Maiya <bhanumaiya@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	Rob Barnes <robbarnes@google.com>, chrome-platform@lists.linux.dev
Subject: Re: [PATCH v1 6/6] platform/chrome: cros_ec: Use PM subsystem to
 manage wakeirq
Message-ID: <ZXpx9esFooSgq11q@google.com>
References: <20231213110009.v1.1.Ifd0903f1c351e84376d71dbdadbd43931197f5ea@changeid>
 <20231213110009.v1.6.Ieee574a0e94fbaae01fd6883ffe2ceeb98d7df28@changeid>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213110009.v1.6.Ieee574a0e94fbaae01fd6883ffe2ceeb98d7df28@changeid>

On Wed, Dec 13, 2023 at 11:00:24AM -0700, Mark Hasemeyer wrote:
> The cros ec driver is manually managing the wake irq by calling
> enable_irq_wake/disable_irq_wake during suspend/resume.
> 
> Modify the driver to use the power management subsystem to manage the
> wakeirq.
> 
> The wake capability of the interrupt is provided by the underlying
> firmware/device tree. Some Chromebooks rely solely on the ec_sync pin to
> wake the AP but they do not specify the interrupt as wake capable in the
> ACPI _CRS or device tree. For LPC/ACPI based systems a DMI quirk is
> introduced listing boards whose firmware should not be trusted to
> provide correct wake capable values.
> 
> The irq wake logic was added on an interface basis (lpc, spi, uart) as
> opposed to adding it to cros_ec.c because the i2c subsystem already does
> this work on our behalf.

It looks to me the patch combines multiple changes.  Please separate them into
smaller pieces for reviewing easier.

Another confusing about the patch subject: "6/6"?  Is it a series?  I don't
see the cover letter.
