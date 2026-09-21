Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25EE3C108A
	for <chrome-platform@lists.linux.dev>; Mon, 21 Sep 2026 23:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790034756; cv=pass; b=DsjIT91/ajGCYoWdGvxHh2UqFqtVxnBR8NptKD7eeKtPPZ3asTfd5e41XmkaQ8kWzOmD48zKa+MOLn/iaEFhdTsv2fp5V3Y4KxoSI+VzumU5OotGu445Y1aM2SgRZut1ZnlKpbJlGgibh1pronkHiVBsY81rjjmU1bYct54bk60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790034756; c=relaxed/simple;
	bh=nzpQT5SxsdB/xegC8rYZLk7oxk3ddENzDmbUKGnvfVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iJ1XeNFkvqXGGTpT0KPQXEEev9FJswI1PDF+hlCBpUJPCGWzw8icnah3YsSui9YWOjYS4AqecBAhkKuG5nboUDRxqwZWBQsADTvfBSPKxTt0aEMOe/bxUa2U+mxJb9XtG1E3OE4EStNcAJw5XjQy8qJ7IErdSXq2WocSElBkVlk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f3XdC4x9; arc=pass smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f3XdC4x9"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-482f63546c5so2749141f8f.2
        for <chrome-platform@lists.linux.dev>; Mon, 21 Sep 2026 16:52:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790034750; cv=none;
        d=google.com; s=arc-20260327;
        b=Lsk2k0WjNfUdFkL82b4jzI3SyY2sKbN+XpDNObbLr1wpn6uoXxay3HQSM32vnWN/St
         UaOgzpGuYHyHOzD8QCpfQuIpQJ1NhHd75B8Tlva3VR+yGyImhn45iyovRk6mufK/EEiy
         11doSDck7XdPN+CO8RUD44eUuOKqZEUj48WuXhqSZdorwAI6Ijrv5qPJvmvmf224HzGT
         x2SQfY2i8ZrnH6xQsndvyml9Wh6fuhYwU//uVyhuyLfH1u2wYSkbSWmWoWSnZXxQzUMR
         ZRPmrHHg5NtXo514pIa4ukzFWDahMf5rGjKxGuJudK+PY0pz+eh72cm6OdPJ2plPW6La
         GJRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nzpQT5SxsdB/xegC8rYZLk7oxk3ddENzDmbUKGnvfVw=;
        fh=xXgazsW/NcrWGynrVhXMRMflc8TdLykFkv/pHFk/W/s=;
        b=pfXaBMSJHmaXcQBG6LTsFFZFmVIkH+PCEEZyQ2qZeXWAOkpyUrf1NiswCF5+2wZfwU
         jRai+UdXrlj0jc6MN3rNl3uPlaa4dBZ6FLNFUegeZfkGoTm4GrC679Amzt+nLiZQ2Q6Y
         aRXwlF9XhzRq6GEP3SLvFKvnyOpN/S7R+gaOumhabRTN4WJiwhvey9PRpEtjLxFRF4eB
         ogo2R5aBaL14GX5clLHCIM/9gcN4lwrZuFNU/RupDgxt9JY4VQk3pk+SmSQNMzX54coE
         wUblzS8hYTIzCV3MDYrv/+hjn6IsFqfH7i9JQ2d3O4YmFd8EmBSpmLcjDNn0LHxgiRRY
         r5/g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790034750; x=1790639550; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nzpQT5SxsdB/xegC8rYZLk7oxk3ddENzDmbUKGnvfVw=;
        b=f3XdC4x97UBbtAMsfn3N29aXi4i/Sdzd+XvaA0eq3fw71ortAkSFun7GRsUKn8NhIj
         n5/yazvPCJM6nrXFY67aP8WXXApJdRrGLxLfThda49q9l6QtocDz2CucKcvehryGHy5M
         iZ/WVL3IM4clVAlbdh5AU1nVmwi+4n/C6RABAc11/qvBfNANS8EV2lBbQ4XO6CnPb/bl
         vps7cLdMk8TQSR1Px8IGZeRXu/YPdYZtOvevdXhKRN4gMNPYxh0nVVbYHrt0sNQW34/E
         FWm/MOUaOkKIu2hs42m3dh1z12mJ/9aG9C/BF5B4yEhV2xClK+Zs3IgL2rz+/DZ1oGeo
         Sh5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790034750; x=1790639550;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nzpQT5SxsdB/xegC8rYZLk7oxk3ddENzDmbUKGnvfVw=;
        b=EFLikG3ztshZu2x4NEUXyqwU5IL5wz1xhp6ahy9irFO0B9fNBqq9FS7eyOGphiKKiq
         yr9LHI2OHTw8r9+7+mI23so/bb/CVeqsikOYhsFV92f8XruBRIUB79SxcDRBiRjNmUa2
         1bfbM38vtO+BY0VAihMX8CuDr7ZsCjY7KrqKpitaI43RLrpKrlZmlCZ746on9LzwJYlo
         PaXRkbiYYkP9wKxATDJ7vaapmOCGh9MUbCq3HA/WKuAPoATxJJ/j4pe5u7apUXcdZRys
         hbsksFANEPiI/0yV136WjHtrRhJiiQDbpId5fSX0bPfewE4hdGaSl9wis818DACRckUG
         3ISQ==
X-Forwarded-Encrypted: i=1; AKwUvBxiZ2l/8ugvKItjT62TR2XdlnBeAzfbnFFCy9yomFiydJgELockgZxOw1zy0foK0FavLjBJkKck6fh9aCxza44=@lists.linux.dev
X-Gm-Message-State: AFuF++lu5VyaPWvnsPD7oySqfYwTG4mdGESP+Nw0+4qiOuKN0h+EDpIJ
	ADFPcHJw0mWxQ4iPgfbaRozrL/WDtNWKS7cKTnUXf6R7e2MYt5V9Uz3PqSKXk3qfMX4TJgplp2J
	QQouleYcvWwikWS9mGYf0KtCxsT7lw/sdgWPWMYVP
X-Gm-Gg: AYBFou24AkDMgfTRehx9JqKpkYNojV7fNSqbntlgA1D6rVj2nRkG49madDZu8/BHU+p
	8XWqRd4Y5j0rYiCmtZbdPABVwmROVHWOpC5CYLbPuXr0fkTR/hMtJvPYpzySgFgUPKbNZkVXmlK
	dBvigKQgklNNJjux4PqFrcLqY4RlLWnGLWt8WtB6JEbawfpUN1DgyfbRw/Ww49ZAZCjKtT6vLOT
	y9G/Q3XHv8U1AVjnLwEWkSWlW/5FNZvfii0s8Z7EhSfmULhMrKsT5Yb7nCE3J9i37zHRK38OD/a
	VogF6P5wmICaLel/zKFC2tDFCOrmKYnyIWBIkgfHzQJet+bhhYivYHrk94to57iYr1GxdDMh8bl
	DvnkT2OTP
X-Received: by 2002:a05:6000:610:b0:485:8c16:5ef1 with SMTP id
 ffacd0b85a97d-4871e36d0c0mr19371848f8f.43.1790034749762; Mon, 21 Sep 2026
 16:52:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260917204209.97699-1-mhun512@gmail.com>
In-Reply-To: <20260917204209.97699-1-mhun512@gmail.com>
From: Jameson Thies <jthies@google.com>
Date: Mon, 21 Sep 2026 16:52:17 -0700
X-Gm-Features: AcwNN1XmQChc3wF9M46vgBU40k-YCjqTLZqTMWXlA9L7AxR5iUA5AqwBC1HrUWo
Message-ID: <CAMFSARfQfOVJ7McNDfJC4uRRhmgyh0iS3T6L4Rzyc_gxTTg=qw@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: Stop altmode work before
 unregistering ports
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Benson Leung <bleung@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Andrei Kuchynski <akuchynski@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 1:42=E2=80=AFPM Myeonghun Pak <mhun512@gmail.com> w=
rote:
>
> DisplayPort and Thunderbolt port altmodes queue work to deliver VDM
> responses to their partners. Port teardown only cancels port_work and
> then unregisters the partner and port altmodes, leaving the separate
> altmode work able to access released altmode data.
>
> Disable and drain each port altmode's work before unregistering the
> partner altmodes. Disabling also prevents a partner callback from
> requeueing the work while its driver is being removed. Use the common
> port teardown path so probe error handling is covered as well.
>
> This issue was identified during our ongoing static-analysis research
> while reviewing kernel code.
>
> Fixes: dbb3fc0ffa95 ("platform/chrome: cros_ec_typec: Displayport support=
")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

Reviewed-by: Jameson Thies <jthies@google.com>

- Jameson
