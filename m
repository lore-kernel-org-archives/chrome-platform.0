Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C57B12AAEA
	for <chrome-platform@lists.linux.dev>; Thu,  4 Apr 2024 19:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712260646; cv=none; b=CCywYc+DxLcQjz5F6+v/gI6l+By+vJwq9yH3DcKFlKkGKIVkDtfxg0k/HsAw8w1XErS3TIQakR1UELbwcgg166W7lCYBFCA726tIET2Is62nnneAnNW1yqsUJsBlBPAUTTYfgZyaJtpwocfTDJ7WXMu0VD0bJp1Vp6927gTubyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712260646; c=relaxed/simple;
	bh=57iUNjFTaRlaydg4psyyiYZxUToLT7xSaji7QjEAV1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KX8hL+oZ14HHS5MNM0SWsqMltRXJ74RCdl8XttT4F/e6HbRmHTyMl/Wl0mB3vpNnUKuWeMbQETqrrYrbWbqaNT5CmfbcEhJ2On0VgD/wb3mVIiunzemEiLSSSOwPreo1ejmlpsq7N2xmzUIJYdqbr8clbtkURy3CZtafESK9YoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Rp36GSyp; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Rp36GSyp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1712260638;
	bh=57iUNjFTaRlaydg4psyyiYZxUToLT7xSaji7QjEAV1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rp36GSyp2cOzqGDEsGMVALm2LB30nFEqw+KJRsE9EgoNTicyIMC85CNzXMiNQciKK
	 6m/pzTHMNKOXa6h3HWSV8T6geFdSXDyFfX5O03yf1o8CrPJ4og9uNfvVIV1stzKtUQ
	 V1+Mm1OONdv9PMYPoSc1nGvU9WV1pusPtyS73cno=
Date: Thu, 4 Apr 2024 21:57:18 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Dustin Howett <dustin@howett.net>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev
Subject: Re: [PATCH v3 0/4] platform/chrome: cros_ec_lpc: add support for AMD
 Framework Laptops
Message-ID: <63954058-34a9-43b8-8ccc-efc0b8429609@t-8ch.de>
References: <20231126192452.97824-1-dustin@howett.net>
 <20240403004713.130365-1-dustin@howett.net>
 <2fba7925-f22a-4ea9-9368-57e50d2bddda@t-8ch.de>
 <CA+BfgNJrfP7H_10r+DLWrjwhkqd==3czhUaH8uC25971aEpMJw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+BfgNJrfP7H_10r+DLWrjwhkqd==3czhUaH8uC25971aEpMJw@mail.gmail.com>

On 2024-04-04 13:59:53-0500, Dustin Howett wrote:
> On Thu, Apr 4, 2024 at 1:53 PM Thomas Weißschuh <linux@weissschuh.net> wrote:
> > On 2024-04-02 19:47:09-0500, Dustin L. Howett wrote:
> > > This patch series adds support for the AMD models of the Framework
> >
> > For me this works with todays 3.0.5 firmware.
> 
> Thank you for testing! I've been seeing an issue where this
> module--even with these fixes--is not being loaded with the right DMI
> match table when it is automatically detected on boot.
> 
> My running theory is that it is matching the less-specific entry for
> "Framework" + "Laptop" with no quirks.
> I've been looking into making the matches more specific for all
> Framework laptops, to future proof this change as well as make it work
> properly via automatic loading.

This doesn't sound correct. The code is using dmi_first_match() which
always iterates the dmi_id table in order.

I'll try to reproduce this issue.

FYI in the case when probing didn't work you can check the current DMI
information in /sys/class/dmi/id/.

> > For the series:
> >
> > Reviewed-and-tested-by: Thomas Weißschuh <linux@weissschuh.net>
> 
> Thanks!
> 
> I wouldn't land this changeset until after we can diagnose the load on
> boot issue.

Sounds reasonable.

> > Note:
> > For new revisions it makes sense to Cc people who interacted with
> > the previous ones. They are likely to have an interest and provide
> > feedback.
> > I only saw this by accident.
> 
> I'm sorry about that. I'll keep it in mind for the future. I also
> think I messed up by replying to the v2 thread with the v3 series, as
> I realize I have not seen anybody else do this. :)

You could use b4 which can take care of this.
It can also read additional recipients from its cover letter, so you
don't have to manually keep track of them for each submission.


Thomas
