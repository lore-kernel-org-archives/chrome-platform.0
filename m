Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795426396;
	b=QXx/jwwSXXnlb8Za3dGpE3aLBqmVjYo4qa5cjUgiRt/OAG6Q++Kut6x3WKwnr7wOmMjs
	 Inab0uCq/9Cc8nbv6A3byxUomC7M+R5h23c3ZdIyVUx9t3vQdkhpZCl2DULH+Zi9Bq56U
	 mbHCCyto4qBwXkpD/vT4SZDGAifcg0ohqRWH9apOdSLhMs1hfOzc1AYX2gq4kNYN8b2/C
	 ZcMcCgpUW6QVMmEp5uJoj8r5kQQzMboZS2x1lqECyIDCV3WMos4Kbt9Dze2/5hh4mD0if
	 eR97nJ58xJFsAguLE9+POhYA+uaU2ailYmwlFf1nHzvqzhC40GdJfWg5scVwhvO5u/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rEQwJ8ittw+kMTmn3OLooj/VNGKrQlM0GiJz9PEPOrE=;
	b=OeDnYBh1yKg/kpzjek0xp92mbHVueo/WNTH6aDuCKXUgiQPyjWepYJA3getNkC2Flv6d
	 4VgtyFUc8/UJTa5LiHx/Q4ZutyTI7RlwfrhzuYqzxdQC7H2DnpmZlYk6BPhVlpqcS3t9x
	 hjN9T9DG8ToHF1ZkrsO3SoqY8LulFfSJcAGW2U0oG60J0yYCyUh8TbnRzFEzxEpu4/sFR
	 Q85epnaLOWlhVIcFigJfn+zFajyU9o6EyIdcx0llSNlp3wnWv+UZ9JTeKEtHupE7xWPNn
	 xC83iZ6ar/O2526PvkOOVD1h75f7LZusHRDRUigz5TV7yQZyp2rvQI6BDhiea88tlpg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=R8ywGKKt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34587606A32A
	for <chrome-platform@lists.linux.dev>; Mon, 23 Nov 2026 09:33:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34587606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=R8ywGKKt
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2f02b9c1f6fso20199975ad.0
        for <chrome-platform@lists.linux.dev>; Mon, 23 Nov 2026 01:33:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795426394; cv=none;
        d=google.com; s=arc-20260327;
        b=oOSVtGZ0Z0v0tfFD26dSMQCVSJ827cHC2crpWZHba5VAaEeLihCqA9tejs3MBV4o+Z
         VW9t2q/MNlyl4z9N3w2I2ulzm7j1BYmDuzZUxJnbuC47yuF5u/jmbFR68MRI1uWKn0HK
         AyOp9ohL2N3LVLc9a3UFvuXmGNMbKeYiQOvk/15uEHMhnhnFx5nGP5hbukoIFRbe9wXN
         F+l+OEZ6LMDWcadDhcViVFiguXm+fnBFFuD0WJqrxrkLdkIzATdRC2AwrlHhEbrHiiEw
         4KwmUyJUlU2gL7eRH8oHr9dkSpXC+oZyHQHZorItn3bGb0O/ezg1Ls0g17TsVIt68z2F
         +3jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rEQwJ8ittw+kMTmn3OLooj/VNGKrQlM0GiJz9PEPOrE=;
        fh=Y44VmQFdomZ/95mbinXb700BtbPY6PPB5Ath0Hxl8aI=;
        b=I1wgN6mEVD4KO2ui0cPKFfapiz49HnG7P5yHplsAOZbX/DATPSpCVSsWqtBSt6RY4P
         s0Ok0j6KRzX1+QhdMRHWiXUUEs2/m/vxE0xZd4Mnkb83TvtIbbZPSGuz1+zpHEfGOauc
         vmiilIrEIM6rGi0U8xDAMNFQdOrrny2IvLS9EZwNzwQC6//+UiIAlValgC46xEWtTWqD
         S5hpoJ2yUqst1rvnxLxUYx0vDrl/pf6Xf2qCHShjyBlG+rkkHGtuWJIvsn9GbrKOQmIV
         cWrHOU28R0OEZEfMvHAbB9DtOdsaPqd2sd6RR5Cu43B3qBzb1JCRd9Qq4m9p+VOF9gLp
         KmvA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795426394; x=1796031194; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rEQwJ8ittw+kMTmn3OLooj/VNGKrQlM0GiJz9PEPOrE=;
        b=R8ywGKKtHJk+Zh2nsX955ZioQf0UbXkxL54D++3OYzxwjmrQhB/z0LtGQg3qpiaxZx
         XWtGGsLdvaHc05akEKHRJJGXobiTEM5l+l3WjODnxhgURDoaE4aFpAIj4+/6cY0yYz7B
         5dVuathKOL3xRDkLT2BdxxddJLVrEJWoUy5Y4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795426394; x=1796031194;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rEQwJ8ittw+kMTmn3OLooj/VNGKrQlM0GiJz9PEPOrE=;
        b=STddYSp1f8XNTKtegpRwFavOdEFGjk/VaoLiixINYrDpdyjvQbxJnel4YlXapKhdKB
         ++q8IGAxzRfpDoLFE3tvBRKY3TlcBrT2gU5dbxnDbyA70Um3wUTsiwABFd6xZLSEGh3S
         wFSN1sAtayw0hou5o79rfAuqhKrt/Kh/a91BfpFOrHibl7SO5Nq5qlI1jOix3Ur+2Yme
         RTnCvEfBO6JA46QYOTta8+6pXX+5MGfIkrDdLLgEJK9YPU6Ex1crkEcle/MBLwCuBeFa
         LNr+vWHjzj/mGZUSrEm+swp8uvCiE1zcxV6iky27CHWVqBm9wbKchUsLcVhtCP2NBCCC
         dZ6g==
X-Forwarded-Encrypted: i=1; AL+hErFZ6sHKaGJGTenh+d1BfJXoERrGBc2BFaLitkSVt33rjJcMle2mZr3WFmsopu6b8W721oGdnJ2WGNrF9AHvQMw=@lists.linux.dev
X-Gm-Message-State: APuU4Z/pNNOxecIr/ut8oikOVG5LiCIIeGtiGyVT28GERhd5Ar7dPGH0
	hDswOwdxedMlpNK3HpCJQeRFeLHvsKKNQk0vMkDbwICVhAzf/d9vCshmkSHRKu69qBqFbhEw3WY
	8Sbx/Bfl+IsZxyinyIsv/05m5oE52FtnVnCwmRvX2
X-Gm-Gg: AZFdTZck0b9t0ZGKlemr6icEM2xxaYdhG9ZRp/37aqQILr0q4zB12xG6iNIn3hmTMdo
	zhc5VmR5sYu1ZiRGgnJpDUSnvIUTICeoksI4G98di0PpKKyLKHV8i65ljGEL6o6X9wysXWBnSVq
	co+6kGPy/3M8uj2ohEb8O6CaZSCNdPE5eN9yIn2ddpo+3l1fnREwm74lFDLQbYQPdE9OouGJabW
	cCPWFv6uRMPI9/fK7U5E1XxjBZdmF37enEJA9CAGGTY2LfyrYPfDxAK1yJ8bt9E0U6tsrniwbbv
	Hq43PA6hANxSVbOOqRGBz1Ttk7ElBlL8BHFfnEz0dveMdY2Wa61klP4vQKakpgqVPEPmWPJoXm+
	zhrR5WerJmrraK/3nn4PPGOFChn/g6/T3HhjxJXa5dack7OxrEpxrpa7yia+ifPhhBxI=
X-Received: by 2002:a17:903:1c9:b0:2e2:d3ef:125 with SMTP id
 d9443c01a7336-2f03efa3ce4mr74174785ad.5.1795426394589; Mon, 23 Nov 2026
 01:33:14 -0800 (PST)
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261018023438.3902617-1-mhun512@gmail.com> <CAMMMRMcBT1TgmOYyYO8dJsLsdzqBiyUU4=S7XzE2zhYh_hpP_A@mail.gmail.com>
In-Reply-To: <CAMMMRMcBT1TgmOYyYO8dJsLsdzqBiyUU4=S7XzE2zhYh_hpP_A@mail.gmail.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Mon, 23 Nov 2026 10:33:03 +0100
X-Gm-Features: Aa3M54pgTzsRiadjShSiXZDHYLQMr5Bhj_1HMO-qoyOLiBI_ZI7BFiyHNfSFFtg
Message-ID: <CAMMMRMeA76TfQnCJN66K6+VtNGE5YG1cNi-TcVhrEJpdT9EdnA@mail.gmail.com>
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

On Tue, Oct 20, 2026 at 10:21=E2=80=AFAM Andrei Kuchynski
<akuchynski@chromium.org> wrote:
>
> On Sun, Oct 18, 2026 at 4:34=E2=80=AFAM Myeonghun Pak <mhun512@gmail.com>=
 wrote:
> >
> > DisplayPort and Thunderbolt port altmodes queue work to deliver VDM
> > responses to partner drivers. Partner altmode unregistration does not
> > drain this work, so it can run while the partner driver is being remove=
d
> > and access released driver data.
> >
> > Look up the corresponding port altmode with typec_altmode_get_partner()
> > and disable its work before unregistering the partner altmode. Keep the
> > work disabled while the partner driver is removed, then clear pending
> > response and DP status state before re-enabling it for a new connection=
.
> > Use the same cleanup when list-node allocation fails after registering
> > an altmode.
> >
> > This issue was identified as part of our ongoing research while
> > reviewing kernel code.
> >
> > Fixes: dbb3fc0ffa95 ("platform/chrome: cros_ec_typec: Displayport suppo=
rt")
> > Cc: stable@vger.kernel.org
> > Assisted-by: LLM
> > Co-developed-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
>
> Tested-by: Andrei Kuchynski <akuchynski@chromium.org>
> ---
> > +void cros_typec_enable_altmode(const struct typec_altmode *alt, bool e=
nable)
> > +{
> > +       struct cros_typec_altmode_data *adata =3D dev_get_drvdata(&alt-=
>dev);
> > +       struct cros_typec_dp_data *dp_data;
> > +
> > +       /* An altmode without its optional implementation has no work. =
*/
> > +       if (!adata)
> > +               return;
> > +
> > +       if (!enable) {
> > +               disable_work_sync(&adata->work);
> > +               return;
> > +       }
> > +
> > +       mutex_lock(&adata->lock);
>
> That won't be necessary, as there is no activity at the moment.

Hi Myeonghun,

Could you please send V4 without `mutex_lock`?

Thanks,
Andrei
