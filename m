Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792484507;
	b=pJ9nuU4NG9KPtSDMYUW4AfQOv2/UwGBnJw+Q9LmEcAqffLslYZxvl2h6baT7hAUUt4wQ
	 3pLC4NxyjaHOOu6qvQq5UECRJ2ECnSy2VZ/Mo6sX+yE40qg9Ewo/Ips2xBr20htM79T5j
	 Wj+D/JwC7KnwQPcH1VYP3Voa+woxXf9soeqMOIH0EydH8tRDGVP+On7AQ3ei3N2E/BgbN
	 B5MTQDJNg7IMOitr+IjF7+7KP7n20qNxjZH8FSTcS2glts8FhfwNU1fkGA/151ThsFNlc
	 O88OeMM77cX7e9w+gmFOuITDytdB6mk15IqpEL89aM99xD7TePY+DD4S314zRJ3LWmQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484507;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7TrZi46+bzFzU9yGi+5LBKjzX2gZ2wzymm4R8mV+ebE=;
	b=362ShqedIgQgfo+PXtQR6TdGtFRoXI1+AgydiuU1XOUfMmsPdSDKpZZnZ504x3+sGnCb
	 t53fyiqUle3U3hTr5diKiAB0Db356VfrGWCndlkkqCSzgiBVyxP6gCBvh8h4dlTqFYMLw
	 3NhTxkLhE2WEi5goD93C7j+/6UbdGZOUQw+twpm6W7+vzyyEAhEyKlm+Ppz8Wb1vQAvDb
	 REEgDbHE/yA+Lemp6w6uYebl/wI8TQ+cIWuKgj+TFFr3cEXG//DQV55IEU8Ovl+H3njAm
	 JJLSZK2jOz3KaB8J2uhHlGty7V2Dqymnzri7CNxo5Z+4MGlDdPsojQnQp+ePLfXww4A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ce7p8tG+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CBE606A323
	for <chrome-platform@lists.linux.dev>; Tue, 20 Oct 2026 08:21:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05CBE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ce7p8tG+
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so2452811a91.2
        for <chrome-platform@lists.linux.dev>; Tue, 20 Oct 2026 01:21:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792484506; cv=none;
        d=google.com; s=arc-20260327;
        b=NTAI0sw1r962OUKbjENnxquGXZHtlMWHAyAdpOkAUDp2hoYyW6qeJfhziqyDojWLQ0
         g/CzLkznBFxKEshledIYwRumrWkqt3Qk6eX0cl+nH5ULKZZJsIi4xYnSunKES2qJhe3r
         OD3WaA3ydHAumf0BIuNqzWPckVNsbPCfstiTy/j6xxpGPHQSmv4fLqM+toj/Iz2aoOBn
         RhOOyek5sdyM/mKaTYi0MDmnvNqIvIQ2F0FNLJ03zbvJm6NmrLWhFGvLBnKjWF/qXO+m
         oEBoPCupCcSdTXoiQNZHbOi3uBSpUdWNYKRruPhrffTa7jM78CABlU88VjmhaiiNMTKG
         5l+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7TrZi46+bzFzU9yGi+5LBKjzX2gZ2wzymm4R8mV+ebE=;
        fh=VbaE/19OKeus+l4qlikDujSZejP/fPm/gOe9WzkeEvg=;
        b=bu+k0UD130Zsx9Ev2DClN9wNEJeyw+WM9aCfi0MgYDfbvm+mSS3XK62nNvOVHhVQgo
         HqPvVhTQXS4BgCWin+Le0JLKdCR57yhJ9xajMi87srpm+HEKWBVeVAGfmpr9pjesLL+8
         6s1NpHN/kIn0BP0ZzUT9H9wRpAXQ1k5tgTjnWUPs/T30S5XC3mRLj4B80XdSRDLINOhC
         JPhc8YKRyEyw2V8szYGb7FIUrnNRUWxdmXtFCS5um1iWWheOvE3rw1o/6h8kWdhSo1Ax
         rkPfSTybzZgEPX7+oF1m3TO396VWq+FXS+p0X3LLkRKsR35DfFYpa+zj5Oanjs2wf5eK
         XqGQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792484506; x=1793089306; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7TrZi46+bzFzU9yGi+5LBKjzX2gZ2wzymm4R8mV+ebE=;
        b=ce7p8tG+NByxosF6uFhEc8Zw3fDyCU8yoMUCA88zxC4Mq0XsaIJfMd6qrbvu9+GLBJ
         FnDyhRpCgjbqUAqVpEVlKTRJowKNRYeOS0aWPSN7fhGUkPGijSSLNm2p8lWm6TVqIgsa
         0BsdJ0y4HdHLqjs1v5r/cvT6JpgKz/8zKg/hY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792484506; x=1793089306;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7TrZi46+bzFzU9yGi+5LBKjzX2gZ2wzymm4R8mV+ebE=;
        b=UifVr8mo/vBarJ+a3cA/W2ZFY/02zvN5FCT+6AUbPa1GEEwLP3USpko/Alp4o0m0ha
         HlkgRLGeIZ+m2lkJJsJbktAfMxJxqPlEM533wsUuMZ5g/0nyPGqEVbaq+UYlb3pr6U+p
         tEEkjoeCyyB7s5wbKIJY+JXeK8lRFdUaZ7MpLdkzCBYMHzcK1Vj1seAuyWYpBkwFdByF
         Oj2rm1Dyo1SFfnSDkV+gjFAH8FoAIsBLY33khRSeVL/zmsytmETT3w06MSIrQViLs+Fv
         MquSZvi6d9lSuJ7frnvGj/9oC33xZ2Pq4RteXcDhizHq6+RDT21novMJG2WKlwYZqkuT
         SWmA==
X-Forwarded-Encrypted: i=1; AKwUvBwSljsE6yVF1T3sLJAnqqkYZHQM4ZuL1Bz7LN2r+QkCrnPildpV0iB23r9XTC8MWeD1R8eLTtKd4ITy/OZvfak=@lists.linux.dev
X-Gm-Message-State: AFq9FYKwGpZZZrGRmUAbT98qgy4WC/QISYgXKRejDGJw09U/1RXXl2aw
	K+x3bBl7ZCAhIHrShVnBLOgRT0FuVlDH2Ydt34psPb8ORxqMlkiWoQxcYytuaN9rjvsOaKUch1U
	Zhs2p0/LgqXiw++m9IxVj13W36B87lDDXAd7TeHxC
X-Gm-Gg: AYBFou326Sl7xBkZgYsejkbYWRuWdxeY5/dAwZn5rqso8+5jE1BwVdK/VTGKtPtKqJa
	AD1lPBxdlAthBk5J9/ObQyFfl1eErnFgW0HCGLux5UHWXeyfH38rdqUjFhu2sdQSzvLdirkF8A0
	UUamR1noouUYL203sbT4rus2pQyeXmuzF6g9fVRFcfmNg//uIyF2EHuonBdXyEHJqSK/LM4btqj
	/pnBPvlY+ajrxmTENkhlRPS6poWOUOWtaS4rKyA8G2PYJ4urRiutE+UFnUVLgpMZaS7c9qii1Zi
	E+vsFRMqR25dGJCbSf3aOLaTLgLgmLFS/TF+xHwlibd6ljZY26frU2SHXvIT7QrRrox+V/Q26RW
	8Jyty0J22yES8aw==
X-Received: by 2002:a17:90b:3d48:b0:3ac:9df3:6b07 with SMTP id
 98e67ed59e1d1-3acef0c8753mr8694175a91.24.1792484506389; Tue, 20 Oct 2026
 01:21:46 -0700 (PDT)
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261018023438.3902617-1-mhun512@gmail.com>
In-Reply-To: <20261018023438.3902617-1-mhun512@gmail.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Tue, 20 Oct 2026 10:21:35 +0200
X-Gm-Features: AclHuK9Cw9XpcnOw9Jqd7JDgzHfajpSJvRQRnH2xODkxZsXKOnuVOr2__XvG8-k
Message-ID: <CAMMMRMcBT1TgmOYyYO8dJsLsdzqBiyUU4=S7XzE2zhYh_hpP_A@mail.gmail.com>
Subject: Re: [PATCH v3] platform/chrome: cros_ec_typec: Stop altmode work
 during partner removal
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Benson Leung <bleung@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Jameson Thies <jthies@google.com>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 4:34=E2=80=AFAM Myeonghun Pak <mhun512@gmail.com> w=
rote:
>
> DisplayPort and Thunderbolt port altmodes queue work to deliver VDM
> responses to partner drivers. Partner altmode unregistration does not
> drain this work, so it can run while the partner driver is being removed
> and access released driver data.
>
> Look up the corresponding port altmode with typec_altmode_get_partner()
> and disable its work before unregistering the partner altmode. Keep the
> work disabled while the partner driver is removed, then clear pending
> response and DP status state before re-enabling it for a new connection.
> Use the same cleanup when list-node allocation fails after registering
> an altmode.
>
> This issue was identified as part of our ongoing research while
> reviewing kernel code.
>
> Fixes: dbb3fc0ffa95 ("platform/chrome: cros_ec_typec: Displayport support=
")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

Tested-by: Andrei Kuchynski <akuchynski@chromium.org>
---
> +void cros_typec_enable_altmode(const struct typec_altmode *alt, bool ena=
ble)
> +{
> +       struct cros_typec_altmode_data *adata =3D dev_get_drvdata(&alt->d=
ev);
> +       struct cros_typec_dp_data *dp_data;
> +
> +       /* An altmode without its optional implementation has no work. */
> +       if (!adata)
> +               return;
> +
> +       if (!enable) {
> +               disable_work_sync(&adata->work);
> +               return;
> +       }
> +
> +       mutex_lock(&adata->lock);

That won't be necessary, as there is no activity at the moment.

Thanks,
Andrei
