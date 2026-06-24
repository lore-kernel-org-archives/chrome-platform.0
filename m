Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F676325495;
	Wed, 24 Jun 2026 05:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782280225; cv=none; b=DOmCJAqnd0mNJFrbf76pZ+IzMCvN+2YQUAiSCASx1zOgHtWM6pZEQCDRGZ99dM8ptujDTOJs1xxDMjb6DQFlV1yT6Def/fmg29pi0RADCftHsmLDJuowdtLGMFYebQSAwZVQUEnpRPb0Jiv6Vrb86lt5W76VollYnlhty1krrtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782280225; c=relaxed/simple;
	bh=6h9rA8AeyGyedpOeqgfe7xsL+9tD0xtg70d7QlsR35o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KJA6UolEQMBKbFMoL2NXxst6icMHr3kh6NlE7ZIUewgwL5V7K4+WsN5Z8jsD4UcZrfCtk+iQX4wdotH/nHzouIJTmEzCiEsZDGEdC03RST9wBah+DwHiby6cp9i6Cv8Mfw9fyxCCOvXah9KKuk9fzOZaOegIhOyz2f0mrSki+9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fzm6BO3j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fzm6BO3j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F0D61F000E9;
	Wed, 24 Jun 2026 05:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782280224;
	bh=+wkjgF/F0HL1OJSUgdnP05Oh1UVUZCTF+hAj+7XbUrs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Fzm6BO3jmr2saEMPDeYjYZwVEwIC81X1KL4Rhoadf7q7Tu2XGaPplZla6FdKHwZOO
	 upZc15GUEa7nC2tAo+ii0bgHPmEy1wrkAHZzxtwgoO7ZmsvascqTkiHfnRWFu/fKW7
	 GZaQtyD9lwzfyVKXrCdk7SeisZ5VmH6+LYb1ey/molUWzdnL4Q2zi+FFa00AgHlHII
	 a2sJJt1TA59XhM+okj8dkk2jfRPXy1NJgawkj3rakXH55wtVpydHZbwOTZfYecuplb
	 37gAP2q5VGR5fE45bwXOIIzWLZTzpMZpPsox/OvZGJPXCEkLYXqB/YonuYr/sXB7dT
	 ondO9muqt7u8w==
Date: Wed, 24 Jun 2026 05:50:20 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Maoyi Xie <maoyixie.tju@gmail.com>
Cc: Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: platform/chrome: cros_ec_typec: unbounded PD cap count in
 cros_typec_register_partner_pdos()
Message-ID: <ajtwHGY7MaeClHN_@google.com>
References: <178214588280.2375438.11710758336343332732@maoyixie.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178214588280.2375438.11710758336343332732@maoyixie.com>

On Tue, Jun 23, 2026 at 12:31:22AM +0800, Maoyi Xie wrote:
> Hi all,
> 
> I think cros_typec_register_partner_pdos() in
> drivers/platform/chrome/cros_ec_typec.c can overflow the on stack
> caps_desc.pdo array when the EC reports a large capability count. I would
> appreciate it if you could take a look.
> 
> The function copies the partner PDOs from the EC response into a fixed array.
> 
> 	struct usb_power_delivery_capabilities_desc caps_desc = {};
> 	...
> 	if (!resp->source_cap_count && !resp->sink_cap_count)
> 		return;
> 	...
> 	memcpy(caps_desc.pdo, resp->source_cap_pdos,
> 	       sizeof(u32) * resp->source_cap_count);
> 	...
> 	memcpy(caps_desc.pdo, resp->sink_cap_pdos,
> 	       sizeof(u32) * resp->sink_cap_count);
> 
> caps_desc.pdo is u32 pdo[PDO_MAX_OBJECTS], and PDO_MAX_OBJECTS is 7. The only
> check on the counts is that they are not both zero. resp->source_cap_count
> and resp->sink_cap_count are u8 fields from the EC TYPEC_STATUS response. If
> either is larger than 7, the memcpy writes past the 7 element pdo array on
> the stack. For a count of 255 that is about 1 KB.

Correct.  This is indeed a potential stack overflow.

> 
> The counts come from the EC and reflect what the attached Type-C partner
> advertised. A malicious or malfunctioning partner or EC can push the count
> past 7.
> 
> I reproduced the overflow on 7.1-rc7 by running the same copy with the 7
> element pdo array and a count above 7. The copy past the array trips the
> stack protector.
> 
>   Kernel panic ... stack-protector: Kernel stack is corrupted

How did you reproduce the overflow?  Was this by modifying the EC firmware
to send larger counts, or can this be triggered by a non-compliant USB-C
partner device?

> 
> A clamp of the count to PDO_MAX_OBJECTS before each copy would close it.
> 
> Does this look like a real bug to you, and is clamping to PDO_MAX_OBJECTS the
> right fix? If so I am happy to send a proper patch with a Fixes tag and Cc
> stable.

Yes, this is a bug.  Clamping is necessary.

Generally, the `resp` should be validated immediately after the
EC_CMD_TYPEC_STATUS command returns in cros_typec_handle_status() and exit
earlier if the counts are out of bounds.
