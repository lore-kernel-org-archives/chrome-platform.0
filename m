Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795034847;
	b=LQG6xyjRmGIgnqArJCyP06v5xxY1BtouV4mRHkhaLcby0Od0JsZ9Gv6QqJAuGrT2F/WK
	 bWRYLg6gKWgYuzNNaCYCu1lcPdcDaffbKOJH832Qohro90GF1CkrtUDN+imUW0OH/rVAD
	 1K8UFPu1d2XITlCAGZpGZPArCEvcQebputF4GW/nb+ZhWo2ZEuDX6N5iFpDCscN3Twd10
	 V/yVTjp4yZjHKpvAJMJkkTilF7domrGW2QtLQt1Max5eGMz7B5F2MZVHwPctV7OhOL4/P
	 KGsM5VcsZ9W+d8fOiml9W/rUJ+IArNmBkVYcKqEuhItjrwFyOa+JsHqyLhDovHg14wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034847;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=/gUAXmz3MujJTDtK8q7SzJkjmM40vdO98nfZeg2M5Hg=;
	b=QjYMBFoeekjmexGcClk0W4OJOrsAjhFd+jZEwRBGXCOyHJiwKiqZ6eKO6VkcYoJo3oci
	 ezZdvDG2XfJstUEDsleAXUwozOwcxYmSxmx2mxs+/lYZ9U8T2HSjxQq9+m/2Ypb8ITWYE
	 eCpG3BFAkUcnEItADKSuQ4Vb8aMVT0z7rIas/QoHIrmJWZm85oHStmEAiaGbPE4Wl2q/1
	 6aF+dLVytg/9wDm9wR9Wzd0blbW0yQULXLEHD6OC6v9y2e9VnsOJ0dG11HS2S5Lp8YvCe
	 BMBRNVsD0E4RdQFkjprnEgTD8GHSlSbqJWNsBOLDsnptEIZt38fDx/bnLpAamlfCcDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dbalint.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Jj48RMuW;
	arc=none smtp.remote-ip=209.85.208.198
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A06E606A32C
	for <chrome-platform@lists.linux.dev>; Wed, 18 Nov 2026 20:47:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A06E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dbalint.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Jj48RMuW
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-3adfcaea19aso8722181fa.1
        for <chrome-platform@lists.linux.dev>; Wed, 18 Nov 2026 12:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795034845; x=1795639645; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/gUAXmz3MujJTDtK8q7SzJkjmM40vdO98nfZeg2M5Hg=;
        b=Jj48RMuWV550SRCVjzEkxjXidxyVp1Kg6v88yFuC3KIhre5TUKH6ZyYaxmE3AUz7MJ
         5e7/nAhKHEMR3RKJE3Ajyyj5BdNbVrubh3CVD4PQc9iDEaVjfTY+DoT5h/ESueOYVh3t
         hJWUAEeqCyfz31w4a3UkslKs44tNOXCwaivuJ9nYxsm2ZRvPI8jjQHdPDu2nbw8h5YAt
         3dxf2KscT63Qp6duUHjrmPQ+XYr2nPEjqpu4kkhPeByDF/O6X/gvqFwl6MWjzlM5gtLM
         WYkMVCyx2pcroKYpj5roZlXAFVzYwmSK9QsC0pdLR9d4w73VX81rYcUSkSxyiW9Ijkty
         Ra1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034845; x=1795639645;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/gUAXmz3MujJTDtK8q7SzJkjmM40vdO98nfZeg2M5Hg=;
        b=Q9CL2HAK1dLsXPEQEQb3ujCttop+64pXAlqOnb8w4WBLaTRAlw3r2whTDB+Tvov33g
         21TuQvZ2PIS0Ad347KF4/BoxDBEI542by1ZYHy+UDDU/KXCcTkt+how/WXSOThIBodu0
         ZFa1Un0/uGtHlOtvvVvkTXf2Ns/G5lGB+81rhGOi1dJ77AZ7/K3K3TITKgj/uVbTkXKO
         l7nbeIS4Z1qEO5lntakYNy6n07zfw60Xtf3lG6Xbt8erXES9AhyhWnAAetu1CYiJNMOt
         PELUKCpRe4tFA28/mD7AjAhETyfG51VAQHwN0vU7kSHEknN7tr4EZJVCoxiIAr76iob1
         X/FA==
X-Forwarded-Encrypted: i=1; AL+hErHemSByNgc7Tiy1UKY3bTetR2JB98SZtZw5y+J6dY0FpUfiYkoC2+yE8s9nLSselJLvxryyCm40X602y4SZcEI=@lists.linux.dev
X-Gm-Message-State: APuU4Z8hHgmOCQSw/PIiEIgGdpPX68CX6WHEOR5CEg9852ActSYF81Jn
	4geujBTchfCbfTo3eVItM6YmTFXdsaWk+kBjEp4d+Om0mQHx92Fc+k6vro2OISI/mAylw11Xmt3
	4OujlasH0iA==
X-Received: from ljvj19-n1.prod.google.com ([2002:a05:651c:43d3:10b0:3ab:3660:4afa])
 (user=dbalint job=prod-delivery.src-stubby-dispatcher) by 2002:a05:651c:1a0f:b0:3ac:a2b0:ac56
 with SMTP id 38308e7fff4ca-3ae6730a895mr13584131fa.29.1795034844920; Wed, 18
 Nov 2026 12:47:24 -0800 (PST)
Date: Wed, 18 Nov 2026 20:45:32 +0000
In-Reply-To: <20261107010356.39d9eddf@jic23-hlaptop>
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261106193129.43493-1-dbalint@google.com> <20261107010356.39d9eddf@jic23-hlaptop>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118204532.257423-1-dbalint@google.com>
Subject: Re: [PATCH v1 0/3] Introduce cros_ec power monitoring
From: Daniel Balint <dbalint@google.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Daniel Balint <dbalint@google.com>, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, 
	Benson Leung <bleung@chromium.org>, Lee Jones <lee@kernel.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	linux-iio@vger.kernel.org, chrome-platform@lists.linux.dev, 
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 7 Nov 2026 01:03:56 +0000
Jonathan Cameron <jic23@kernel.org> wrote:

> Hi Daniel
> 
> I'm not necessarily against this but when adding monitoring components
> to IIO the usual question is why not hwmon?  What features are not
> well supported by that framework?
> 
> Note historically I suspect we accepted one or two drives into IIO that
> would have fitted better there so precedence isn't a strong argument.
> 
> Convention for these somewhat borderline case is +CC hmwon maintainer
> and list as well as IIO with that explanation in the cover letter.
> That avoids any last minute surprises!

Hi Jonathan,

Thanks for taking a look!
The main reason for choosing IIO over hwmon is that for On-Device Power
Monitoring, userspace needs an atomic, untorn snapshot across all rails
(up to 64) over the same integration window, triggered on demand from
userspace and read out in a single buffer read rather than repeated
per-channel sysfs reads.

Reflecting that requirement, EC_PWRMON_LATCH on the EC is a global,
stateful command: a single latch simultaneously snapshots all onboard
power accumulators and resets their accumulation window on the EC, so
individual channels cannot be latched independently. As far as I know,
hwmon only exposes independent per-channel sysfs attributes with no
multi-channel buffer or on-demand trigger ABI, whereas IIO's triggered
buffer interface is well suited for this kind of pattern.

CC'ing hwmon maintainer and list to keep me honest.

If there is no objection to adding the driver to IIO, I will clean up the
custom energy_value attribute and replace it with the standard IIO
triggered buffer interface in v2, along with addressing other review
comments and including the above explanation in the v2 cover letter.

Thanks,
Daniel
