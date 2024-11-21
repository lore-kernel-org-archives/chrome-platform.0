Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592FD1D7E5C
	for <chrome-platform@lists.linux.dev>; Thu, 21 Nov 2024 14:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732198293; cv=none; b=MbFRPitxivbQCjGV5LU8g/Q4kTzPvOeISj7SqoECz2iGVIMiElI2PBMILflaIRpdiQvAOp5D7sqavxb67f1dddCnhH3osxwkdAzp8PCSPWOFoZLbMQGDoSUH6jt7ZVmo67teQ+tY1dbBGx44wclL1qKAjt8IRNXZOIs3OOvgVyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732198293; c=relaxed/simple;
	bh=12KnQuruKNomZfCP+/7ouU/4Ek+nc9HLabn0jx5kFqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LEAkFaP0TXReGRMCbKXf2J4GfOE6owWnZP8s1DjHsDsc+CDv5AUH1ovty7/Tnkb5SGkJzr1R6L6USVRvtBbZng21WcsbrEeJ5s+wYkaC0sr8Ht9rrqzkeBt/JS+ui3xQq5fOmbXMXDyXlBBn09a9IMs89XhrmcTUkBuAPWpi90E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de; spf=pass smtp.mailfrom=t-8ch.de; dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b=qelBfNJY; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b="qelBfNJY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1732198290; bh=12KnQuruKNomZfCP+/7ouU/4Ek+nc9HLabn0jx5kFqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qelBfNJYkw0175lCJKyJQfxRl0pu2wMdshZi+oucVo6c9vH270UvCrUZXegQ/RF/9
	 zWwdDhKpmTrrbZXDoLWioAa6yB+L99mc8gNbJkQ5vuPeVa5axd396itxigTg0u1KxJ
	 Ww+QDhraZmrrmTnzdI/IAZmUN8i9TQVCNqbSeTaA=
Date: Thu, 21 Nov 2024 15:11:30 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Sung-Chi, Li" <lschyi@chromium.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] platform/chrome: cros_ec_charge_state: add new
 driver to control charge
Message-ID: <7fc1bbbc-3cba-45bd-a5b6-0029cb5bb8fd@t-8ch.de>
References: <20241118-add_charger_state-v1-0-94997079f35a@chromium.org>
 <20241118-add_charger_state-v1-1-94997079f35a@chromium.org>
 <8fcf9154-6c0d-42eb-901b-0cc9e731e757@t-8ch.de>
 <1e8bf721-f930-4365-be48-a8c5964c1457@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1e8bf721-f930-4365-be48-a8c5964c1457@kernel.org>

On 2024-11-21 15:00:13+0100, Krzysztof Kozlowski wrote:
> On 21/11/2024 14:47, Thomas Weißschuh wrote:
> > 
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static const struct platform_device_id cros_ec_charge_state_id[] = {
> >> +	{ DRV_NAME,  0 },
> >> +	{}
> >> +};
> > 
> > Reference this in the platform_driver below.
> 
> And missing module device table... This wasn't ever tested as module.

It has one in the general MODULE_*() macro soup at the end of the file.
But yes, it should be moved where it can be found, right after
cros_ec_charge_state_id.
