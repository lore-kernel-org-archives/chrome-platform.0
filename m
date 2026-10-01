Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB115275AF
	for <chrome-platform@lists.linux.dev>; Thu,  1 Oct 2026 15:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790869216; cv=pass; b=Q3pXMvjlnMw8VN5Y9y5PvPaEKWXPH2ugn9+vw/CDcBylLVK9ZwndaHnCCPb0NFGMMGvaWITEGimmSPK2bnMgkibR9oNik+NtyMR+qBTfhIUdSp3XdTCb7cOyIJ5Rcwsrpr3qgxNCYd3GgV39RU6Ie80bFsnQEsLInYGpQMQ8fRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790869216; c=relaxed/simple;
	bh=Rt5kCYTovKo79P8T5a1y2BU7GEOnV/NaT7+bvWuL78c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AGKlYdyP9H6/DFI8bruEJvNhXJA5PqiKEoM4b2SfcMtbSXGefvl4NTxZHmq4ZVw4krqrrZxZF/mYYOvUddmrKwwYJfWqsEJkbglocXU1Iid8stIUSP7+FlfuNupHroHlFB1MbXwNjswsVODPZc42P5Ah9Vg5sC2SELcAW0zEgeI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PswbG7g+; arc=pass smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PswbG7g+"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2df4aa80a73so44477185ad.3
        for <chrome-platform@lists.linux.dev>; Thu, 01 Oct 2026 08:40:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790869214; cv=none;
        d=google.com; s=arc-20260327;
        b=N+y9KFS1Mj2IFQmiCSuoMVh4zPB9e4KhZuFtJ5Cj/NGhx51lpyCDhssebjM+IOJdnF
         MCKh+LxNKiQonPaROpgBY49y9qb4zksyEExLA0GRWh0+DDQ4I4c2INUqTkw7dDbtaW/i
         77G5EnMA5MjZ4Z0lX/7W9cI1UAmppavKr1j2N+m4B6kQ5sbxJY0V/xnUTtSucB6TX8LD
         +lJVkks37cie6lEq9ASdbKD9tTfy4F0Q83wZphKAHoxtvwgXl/nlt5S4sRkca9UREZe6
         8gVD0KbWn1kMlgD+VuzxruRrx6yTNxOOUE8yI95PFWY6mb8AcjKVXc9V0XwypSsJFhLC
         aR4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sH7suoulEGbXb6HUyxR66b9Kl139W81dotKBuuxFi4g=;
        fh=+7k5VJWozw+vIbBq445xrh32iq92D6x21Uir1KWFKYE=;
        b=kUcBjbZZ3GwLmj6S/gpPWGbMYAAlm969ISSkEXyqUnRLcScbNZQQKEvFpkLcLYWNUC
         qRC96y1xfqL7iRYquOKjjde8/SNrcPtA/YEx4nP9yslFwB+GR2gaWNEbU7+OeVjagetc
         SkOqmkMExiPjpqklBeOWFfFYkTTjJYqLwSjyZ3jLuLb2X8oO4gZaeYzVgNIgEUin7nPr
         DE6cev5B9yyaagq2qHRnY6Z5HQi6rksFy319oNjO4kUjRbvJWSJcqaDnJqvpKaRBf1M3
         TdkYmrNdDA65d82KAsF/O4kILJfyMgzegs83NL5NRbncFurvzNrzb1XQZMPPzQOmzaoP
         fSqA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790869214; x=1791474014; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sH7suoulEGbXb6HUyxR66b9Kl139W81dotKBuuxFi4g=;
        b=PswbG7g+qIVURi5SrHDa5jZ/Mjuggi4nuf1zZaLF1LAuLisjtPLkiUxySpkCvCrsoi
         /jeiSLRsi/9WfGuKISj4MrPa2e6vyA5ChEc36lK/ChaUgrYm4ba02c9HlwSzQTY/l34F
         PLbG+tL3o5dgRbbmTbMLO11wmyBiwVBmLvliU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790869214; x=1791474014;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sH7suoulEGbXb6HUyxR66b9Kl139W81dotKBuuxFi4g=;
        b=dMmhRaOjSHYSo+U4Ocyo5JO/6I6SyEWWzpDOtux75rE3+Qvi1pcPg9lSga1+TkRiIG
         OQoboqg9k2eL8gSTfqp98UtTFBxcFM9SeYyAMlbzHppr6Ls/NcXlyGodSARZIfyFUlFf
         HUw+2yjTNMZEc5L3g3FMsqwlZLhf6G8RDDufPKSwOv9BVqEpT6VbExnMW4OBjwufS5Jn
         xzeWiIRZ4K6+MW4ivwcDssqyv54ymBou4BPml6Y6UMPZP9e+y4RBhpsGF6En4KMOk3NR
         ngh2rVczP5dhdfC/VYOKobk/Ft91lR+K8pUM6LWhYhZI51+btDcl9+/taN4ixsiMgh/f
         FKqQ==
X-Forwarded-Encrypted: i=1; AKwUvBx+pY971hPEP5OOc0j2/H8Wa5Zwpbb86bODAZQi0gMXNPqcO+piPi1Y/18SiR6JHIc+Q5lEAlOLrUnlW4DIG9c=@lists.linux.dev
X-Gm-Message-State: AFq9FYI0GagDa2H8QmQw7uDdc+0TAYhzN4RybzK1hnYYVHE6Svv7fSfv
	vAWl5PZ/pk22/K+IGXpxIiDhotpkQG13u0e82Gx++Yi4TEYSa8qI2wVRs1GGIW3H3O2Otk9NIDY
	8JSMVV4f9dlXe9g1ZCRLWkqgIMCoLXVnCaDm193uo
X-Gm-Gg: AYBFou3bfoMv/JFdvJhfdPY3MzuXr+YSJy86gsJmDVwGidzBM6I/KvB5dZJbTT0t41M
	9SVGXgrBVFCrJ3d8UhYvjbVAVoO+7qgJgEotXSKEFnOfd+E7FD1yB1WivMaIPNFc7511XV0qNgg
	O7akYLBU2oh/Jq87GPggzJcDRNwdCEudOH0j2ADd7aOalyFstrwn6kt5TRxUnPPrIx/CkXZ5m23
	kQIKqCjYlISy6ImP4eOBsr7aVlPH4hJ8wrB6pb9tCNML3bzdJ0OrFvOIdjhoAvrgw9PVyZoVFMH
	npko6PMGEX+5DaDX3OJZ7LKlJTkjf07HNwZ/cnQJ/xtOC5dyFkXvqKq9qlDVztnf2t0e6cTb2mu
	bM+d8AZc=
X-Received: by 2002:a17:903:19cd:b0:2e2:b00f:564f with SMTP id
 d9443c01a7336-2e2e4a20259mr42758525ad.18.1790869213794; Thu, 01 Oct 2026
 08:40:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260917204209.97699-1-mhun512@gmail.com> <arpa-Ps8l8LOwbbx@tzungbi-laptop>
In-Reply-To: <arpa-Ps8l8LOwbbx@tzungbi-laptop>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Thu, 1 Oct 2026 15:40:02 +0000
X-Gm-Features: AclHuK-ph787-_ubenGMoiVVddecDSrjn5jG0cc2n9OWoEqyfW5NTQ54A1U_4YQ
Message-ID: <CAMMMRMe7g7yj1iOTOc+TCWe=+1cjFA1rG7H=VfjnrY3p7XCKFg@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: Stop altmode work before
 unregistering ports
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Myeonghun Pak <mhun512@gmail.com>, Benson Leung <bleung@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Jameson Thies <jthies@google.com>, 
	Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 12:18=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org>=
 wrote:
>
> On Thu, Sep 17, 2026 at 04:42:09PM -0400, Myeonghun Pak wrote:
> > partner altmodes. Disabling also prevents a partner callback from
> > requeueing the work while its driver is being removed. Use the common
>
> Would the work be scheduled even if the driver is about to remove()?
>
> > diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform=
/chrome/cros_ec_typec.c
> > index 50a68819ceb7bbfbd888ca919d678d4c75237c26..e91bbc219c077067294935d=
d5602c1aec636cfa6 100644
> > --- a/drivers/platform/chrome/cros_ec_typec.c
> > +++ b/drivers/platform/chrome/cros_ec_typec.c
> > @@ -378,6 +378,7 @@ static void cros_unregister_ports(struct cros_typec=
_data *typec)
> >               if (!typec->ports[i])
> >                       continue;
> >
> > +             cros_typec_altmodes_stop(typec->ports[i]);
>
> Shouldn't this be called in cros_typec_unregister_port_altmodes()?

This should be called in the very beginning of cros_typec_remove_partner(),
or even in cros_typec_unregister_altmodes(). The idea is to stop the queue
when the partner no longer exists.
Partner disconnection rather than port teardown ought to trigger this.

Thanks,
Andrei
