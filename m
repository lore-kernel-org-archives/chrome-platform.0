Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9C7397AFF
	for <chrome-platform@lists.linux.dev>; Sun, 19 Jul 2026 14:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784471676; cv=none; b=sMuH/8NiOjipet1HhcGvqvQfOR7DaPYiW6bVBuShqbiKnBiq0q98BB+MKPJwiam/ODyCCl8hPtRNzH1DPRvq1KmJyIMTX5BzwFvVSf6lU7wFFlM6nylYIlB+YxCKQVyIkN7c0+vyISpTv3GPaQh3jKYXZjgkw/YmJsk5bJ8rmxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784471676; c=relaxed/simple;
	bh=MYRme9/0hd5gQ+iZkUXgEwdZo0+Tc2QA6+dqgqARUtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IjZ0ZkM61dWxA8nbN35voUDtXQP1F+/cB8FgjEJZ2Q8GlkFLBuRnCytwueTRxsn/KHNwCEHNTXlzKkobyPGlpQoqbgMQCQhqJ4APg+zugA8WtzxG2uno7RcjNtbZLgdHcia9+9MThohHAsWWS95wjoENIeMwwqxRpXIHVuGk05I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jUMTojMs; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jUMTojMs"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-848882fdb18so6560256b3a.0
        for <chrome-platform@lists.linux.dev>; Sun, 19 Jul 2026 07:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784471675; x=1785076475; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZuYYfoOm8o/21SPRFYJR1NlB3VZ7CmSNo2hjOFoKrYo=;
        b=jUMTojMsSVtMUXG+kSvdRLupUDJ1qK5zNQC7FTEO/kxBDV3eGp8P9uo85NkPcT1ukl
         Xcm6O6wTjwgExqKALZTOKL6HXp+ZV00Iyi3LkwkbXpDwFZuEnkeAkwx1wFagHYbZxYD0
         ZyliZ2BnTkgt5r8ik5tT/gMRY37oCwniQCz6BcBhFYjBWItFpE1W8DT1ZIwNon1rWnqr
         DfHkXQhKWm7PLxpPLfSybzn6z1cDb/5cT0ck42m/TLOAQwN4uowDx+hjTByOZJX2DMXe
         YE59zjCj7PTnBcSAwTKeUB5KNzP25m/tg0mcgOZrsksiuOPfJN2Gx5LcxbetJmIXqouR
         2+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784471675; x=1785076475;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZuYYfoOm8o/21SPRFYJR1NlB3VZ7CmSNo2hjOFoKrYo=;
        b=PvO16lgRmCYSBpNdUy3v74QW1QDIa79IOMoU+3M8ljM9RZKSCb5I+uJY6BvDH4l0Vq
         7+LFOk/HlaNapVA/1IBEtDM/qQdXOh/23KCUXjgmegbqPMUkDSjg6KtHy9dXHJM/TaIZ
         xDr2z0YxDm54s2/BTRdIOrPhcmi8K2j9VlievlZgFE9nXRwVkw5v+nSxm8BigAKpRVzY
         w9hF/QNeQKwE7mkgjWX/et3BY/CFumllxUsVmy9N9FOMxKcuo0LiTZvBIv7NBbqjisFN
         pVOGweDRoqvWpUJN8C7ffO2ZsXT3JRaKQV+aE+r8asVB2jXlBl8kICU2wI1H541BQwXJ
         fLfA==
X-Forwarded-Encrypted: i=1; AHgh+RphpeCoAgP/N6Rk/fGkhbsDDVC37s875rTUQnzKz27cjWy52V5oIb/dsfLzppSAZMIgT9wpdIgYLjEAEuJfKH0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxIfYmj2NCD8+YUt0QTCWZoNNzQ61500fVGtfalnXjgCn5KR/xH
	BQqjmPseLr4jTkvHkjUz5o9CeBaYFl5Pp1iNE+KLKqzUc8NJdGgJVQTZ
X-Gm-Gg: AfdE7clKn6GIo6TyzgeW3O9T2v72ezu8U4+LstgtUUbG6NapLd1yQv2i/xYO6rNkB5/
	HpynuTF3rnduSsyK6Ehtb24XbUP8vck79LxZFb6RNNiLpVYJRPDqrlMQ3ZkvnwemRoNHzrCmsbx
	UfBlXpbpPOLatUqS+5sSqYg7BThO71DNGuI7pScEByQnYKijl74yUzTRcJyA03fGXLRWqzNOQwJ
	6oltjwo2k60FXa9MWnNOmTY7UFia2fkqN1XN89TMQaVQo3HuOogXqpfjHOcFJ5NU8Zj1/nH3cLV
	ymwevwU/2JaoO8X4utcZCQp1uQ0Z1OA/v+nPjBSx8H9cHSLqmn/zKZy/iXzN6lUVoMQwgf+Kqa2
	vHx7HFTT+7bc6ohS6QygBS4B4cN3pEJteB0i2a7rPGQCF103iJTacrI2XCvx3cLzl1FRIHsaQji
	4Aq2x6wpgw2JVXJZXPA1XNc7vfJJiE2eW3AQpK
X-Received: by 2002:a05:6a00:4212:b0:848:401c:98e with SMTP id d2e1a72fcca58-84c292399ecmr10382758b3a.15.1784471675040;
        Sun, 19 Jul 2026 07:34:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb519aeb334sm3399325a12.18.2026.07.19.07.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 07:34:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 19 Jul 2026 07:34:33 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Sung-Chi Li <lschyi@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] hwmon: (cros_ec) Register the thermal devices after
 the hwmon ones
Message-ID: <359239e7-5986-46ea-a782-ab2356d581fb@roeck-us.net>
References: <20260711-cros_ec-hwmon-locking-v1-0-cb6d0fdbb2d3@weissschuh.net>
 <20260711-cros_ec-hwmon-locking-v1-1-cb6d0fdbb2d3@weissschuh.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260711-cros_ec-hwmon-locking-v1-1-cb6d0fdbb2d3@weissschuh.net>

On Sat, Jul 11, 2026 at 11:59:05AM +0200, Thomas Weiﬂschuh wrote:
> To guarantee consistency for the read-modify-write access in
> cros_ec_hwmon_cooling_set_cur_state(), locking is necessary.
> The locking will use standard hwmon device locks, which requires
> the hwmon device to be ready before the fan devices are set up.
> 
> Reorder the initialization so this works.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Applied.

Thanks,
Guenter
