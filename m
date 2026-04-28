Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAC3390204
	for <chrome-platform@lists.linux.dev>; Tue, 28 Apr 2026 19:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777405790; cv=pass; b=Ivw4S4qoEKFXamaLVrvvnJQ6ghydBKjG6n2XBzTTsQMRu4ROqboeIoREN1iIua7UH/pvTdwc0vDAfwdxx5o0ffFzPfEX1a3MOjXsO05lF8yPdVCZiXY6udfI45V2+WG6GVi6WAN9K/PSEO7dJUH9qX9gfr5gRiBAqzNqwPbJrUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777405790; c=relaxed/simple;
	bh=PMQX+JtEqhsmGUayCjLlV75yhTzY7WEWZdMUTzWOfDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T6gTSPh2Y8/xIB3Cg1lMr2AhRF/W7+MzA2MvmE2uwJ+xSrTQzM5pk0eedoaxG4yoGfcANAgD6S0AD2ud2kDSfzAVtSoM0khr+qzLr/lF46/O6KoywiFoEqqFNiT3S8DtO4Q3HV7rbuUmDZnjeJdSqnaMVN/DIQr4EySbOH4f0lM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=R964YvgC; arc=pass smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="R964YvgC"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4891ad5c074so13145e9.0
        for <chrome-platform@lists.linux.dev>; Tue, 28 Apr 2026 12:49:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777405787; cv=none;
        d=google.com; s=arc-20240605;
        b=HpMuz8gB9RKL9qERFz3gtkbgHP+OY4QXETV88Z9c/EReLeLqNFpklqNHl0lslvn4IJ
         xFEcHW8FZp0yMDiich6gUt6biFZ9yDAcirrYW3Xyzrk+Ttk2/j6TRv8O8SxixkuCFZQn
         tFXlszu70VZYl6Cv1fr1tBDcmqYRbvWJPkgfK8qWC4rjXOiaPFfujzouykjMaHQlAaWT
         wvLmc6p3065daxW+8rO2X26/skuXDFLEG1seEfkq6id+XNYbamntWO6cqfoGKY10VL8i
         6zTvcZzqyMIYnAu/UQGbMZUhR2HwiduqrsfpsZqi7sVqraZ9QjCjKDYmEafoG93zrNw0
         p1xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PMQX+JtEqhsmGUayCjLlV75yhTzY7WEWZdMUTzWOfDQ=;
        fh=biha0tpVlmZB5Qsx9mcVg1AjOVIVAZxyMt1PBJUk/E0=;
        b=ebo75MdYMenPHwlNNKAEIKLIoNogqIT8FEsALefOWmQyrEHpqQpXWnughXJcW96y+h
         IPlzWADo2ib1/7t07pC1+UgRDF30LmZxdRsSTzih21RZ0CDJp39w/T9g/OsdQrjzqa87
         6oa5c/mrX5YVKC5tlDXXmkIdvDaCm9L6LxVD12Z1H2nN4i+hsdAQTs+Ulry3SM2oau+f
         y2U3boftZ+iKpsjtmudbDGSDvI90yCQqsbeQyrQXJMPU8cTdxzbHnpJkSoup1vnmO6gu
         APLaA1u/dT1KcTirUq9A1KAbUvh2KvzUTEndC6OVHAvbIa/DVteiqpPDUFjDppfSRF64
         Oq+Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777405787; x=1778010587; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PMQX+JtEqhsmGUayCjLlV75yhTzY7WEWZdMUTzWOfDQ=;
        b=R964YvgC0kI9s+JvbbecCSXPnxjfP/xXv+DWsH1ox/2spWEVOvP5cy1YVcqsB0ybLM
         HvMfbuM9FgpeRuv1uaHxz6fVSRVBB6Ph0S9Qo9f87VGFw7GMgxAxdOsCAiU4l8N9tZaT
         thzn/uuhvdZ8v3k0apPJLJf9LECbACbVcX9Ak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777405787; x=1778010587;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PMQX+JtEqhsmGUayCjLlV75yhTzY7WEWZdMUTzWOfDQ=;
        b=CQOXbHyOvcUSGkDPnTSuse01inPRF7/++Q5vAakd2LI5ls3mao3fekEO2bNsK2S/vx
         X0SYaiKjs68JzJHALSGN7kaBKFxW5fgsYg6Kwehu45ZJx0pUdxmGou5BkRVa+a9rnaq7
         EZu3wdTyupSk1RUlzOTFZt+ErRYIAdB0uaJjPD0pEQGvoGeBarP+sz6VZT8zZu6ByUvj
         +qpYvSMscQ9uKFhnYMzbluEl0yK2esXpUWyDHpbkjy2kp3RgyhQSlmv+TvjCEEME/ncB
         RnTqMTIRrkP7Z2VE/lnp259GE/wVG+k3c0FUmjXSg5+9arvTtbmR79yYd21m0LsnjjEG
         dRkA==
X-Forwarded-Encrypted: i=1; AFNElJ+STp50HMSCEa+CVk/gfB6Au/l9g1hmna/lKPD0aIniJ6/JfwSMBKIpJpHX18Rkam4OkgWMsiy0pEyoQet82Ss=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0mFEP2H1P3esgdrxizwGUaj3gG+AnGPs0Kx1Jg5yMOKJa8AJ8
	cDMvCpmx0d8GJXA/d3U8WGzkOBb9aA48cYdA6y7AqzRQtbEcwecE7cZg20myerrrXb0XdC96h+p
	IZRFrfQ6PHUG+OfZQe7SJcj+wno/ADVrXk+QQXiSj
X-Gm-Gg: AeBDieurQJ4Ftyr6BhX3UyJo0ialuNK29GClBy6ADiReXYso0CRctc//kvxGKTxjhqc
	vwZifDC86bKjzPkcojTzMf6/T0/CbfR5st/tM8HxzO+3PTVeYtTzHh4Lj7EUJuWFsjHT/zdB716
	Yis4IJcnuuRq9Tj1n9hQQmqeeaXlKfA8vzB6B88INa7gupi8o5MSOtoUqae5AMKYuEyAHoK/0FR
	+ixCVvjFg76fmEctrd6OF4hk6bI9Izm1Jr00mQ5Nb1UuDjGX1pAdiR09MIzvWoL5uZyFneZfM25
	X5tA1NCkeHrbUD1ssQq/RJ4XVePIi4Ke7nxeb+8vXwuKNL5NdLoVd0UC6Jk=
X-Received: by 2002:a05:600c:3e86:b0:485:1a54:9407 with SMTP id
 5b1f17b1804b1-48a7b96a787mr304045e9.0.1777405786820; Tue, 28 Apr 2026
 12:49:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260426220204.118399-1-titouan.ameline@gmail.com>
 <CAODwPW8S2q+mcLY9xM+p6usqa+rXXj7nv0QBEve_4hywMtO65g@mail.gmail.com> <CABvHBc7nPNoU2riE8ckT7gt5V=3PBXOKhjE2PrL+Os+Si0TytA@mail.gmail.com>
In-Reply-To: <CABvHBc7nPNoU2riE8ckT7gt5V=3PBXOKhjE2PrL+Os+Si0TytA@mail.gmail.com>
From: Julius Werner <jwerner@chromium.org>
Date: Tue, 28 Apr 2026 12:49:35 -0700
X-Gm-Features: AVHnY4LebBenDg8BusnreP1QYgr3YNJ1ehXvfyABUUCMiqR7-yGmbCGcr_4YXvk
Message-ID: <CAODwPW8T6o93pQodem-hNrszH_dsa5KMTu0iRY6y8CLJNjfXsA@mail.gmail.com>
Subject: Re: [PATCH] firmware: google: fix orphaned devices on partial
 populate failure
To: Titouan Ameline <titouan.ameline@gmail.com>
Cc: Julius Werner <jwerner@chromium.org>, tzungbi@kernel.org, briannorris@chromium.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Given that, would the right approach be to continue the loop on
> entry-specific errors ( logging a warning), while still aborting and
> cleaning up on systemic ones like -ENOMEM? Or is the name collision
> case considered impossible here since names are derived from the
> tag/index and the table is only parsed once?

I don't think you should hardcode behavior so specific to what the
called function does. Trying every entry doesn't really hurt even if
they all fail due to some systemic problem, so if there's any chance
that other entries might succeed, I think the best option is to just
always continue the loop and try the next one.
