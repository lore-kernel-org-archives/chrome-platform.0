Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463CE3E51D4
	for <chrome-platform@lists.linux.dev>; Wed, 22 Jul 2026 08:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784709272; cv=pass; b=crR/2xwJi4apoqN3Q/eOK5V8S+/4UFVGzo+PJgJVZ0XSPo7bAWwpF2oie8H+H0CtKJVQqb5sySDQNRQ+8m+tUvDD60ASDP7L96T9PkpCY6PDCB8t4/E2gZ9RrgImlVA0JDePkHSL09Z0uhV5o1dRsJ2WNxOJM25LNx1uMuePH98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784709272; c=relaxed/simple;
	bh=nsI28AOe10DwMfFECWTYXs7YxbtRBLvRLKMl55KqieY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WAQNe3FQuhPb2bcnrfKeE2sWxnJnWqo//bU5+AXb04TwcM93VP6JhuhegkGCY/Qm6qdLuMVzS09rhshb7WasTWkEJ16ZMw9UAOjAEOkugmW42qey3J90I18Eg+ZKy5quxF9Be79lokikGHmxXHIIBGbwwLnXBRBsHO2sJEbjR34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ix3jj+lq; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ix3jj+lq"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-81f3b227a4aso2354307b3.1
        for <chrome-platform@lists.linux.dev>; Wed, 22 Jul 2026 01:34:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784709267; cv=none;
        d=google.com; s=arc-20260327;
        b=P+FRQ5zYXjHfkilL7b4SAIClZyej4bb9U1rMrqZ8osRZ64EbQxON6Aj5aveq+2euw6
         Faas1OOH/VboGtIplYNrJ+BRmL91pQ5Vq0xW66A22TRJg4+HnG53qBMTBVPSx2SjjFXG
         hThlWhnmnN8Gk4atnyFqRTkXTFunMTL7qf69vP5+mSC9X5kxCEJ0BK4ABn7oYh38fDDH
         odv0/rihjQ1fCi5i25VaqMrFGOmU/jPLvDUN4cLPNb2ONbnER8sEbQ22i18HpGWOifBW
         UbIMe6ALs8m5LYUNbbwL7JMNYt4eEVxzh5uM4GqP7QRQFqYozVeNXroDkRajc7egDqDf
         wB5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mo8WgYh25ldjyX8DCM5vtgvNxtGzO4105EDC10m83EQ=;
        fh=PouMw3xdqaQwJbHFC8mbZUsOJqzsnzchLrSwObmGoDQ=;
        b=N8QSrMUo7LMmj+zMtd5risOfx0Y89PzCCLero4tBEgZoKAkZyJoNcLYgKRJQVxDAPC
         GCdcg0YnOMQODvs0FEWv3VEc1T3TLJza0ObxVvsjYY1CrZmw2cjKHiiRHB4GXTj7bSwj
         7G2/p1Oe8wLqdrSTqRwPaG3iU+fv3RPRKSnElzvAW9/YZkEMUuGHdfbG4gQe260KOse5
         ujb0lRTPbL8Ac6A/n27bbEeAztoK7O3v8dTCjpaluiWo1BUv+6rg7rouUUYD21lmKSwJ
         F7lixsb/QQklpJ0JoFHZztUtMo3f90MaFY21qNtjL4y4lcPcMMjHt2QSA4QDQUR4kA92
         Df7w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784709267; x=1785314067; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mo8WgYh25ldjyX8DCM5vtgvNxtGzO4105EDC10m83EQ=;
        b=Ix3jj+lqVa8390JtJfSCwFtaxqKh7mmWMopoJDX3WAbgke/pazcX8DUCStVx2RKB8Y
         +pcf6SkeCkK/qwMrh02AW/GgPKcJcMYDbc44G9fw4NrN8VJGimrxcftnQxR5exM64s5m
         zkenMuiuzpoCJyRYYm390fJxWLpaWDHnSTvC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784709267; x=1785314067;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mo8WgYh25ldjyX8DCM5vtgvNxtGzO4105EDC10m83EQ=;
        b=OYtc+LOm2Ht/J7cXyF4vairvbDuKMP61IwEN6da+NnSXHaqefHaKe88lhDeHsgSrSJ
         awaS1Nm6wik2XZYJWHM5C7uD8YcdZwAQLEAolKgZCW1wEeICWrSRJIxjqpcZwVb78bYV
         XU8IevYd9ggKJ7Vtg1mkPZ82dz4O496Nhtg8D8Ta/Ihvof72Bn+VyCsHSoI1Z2vBZ34v
         epkAXzkKFW2nekEWK9n/SdWznjZkzx2YLSZZPG+umjvn0y8g9nOAwfW2BUotTdPmzPEK
         xyhohqnUb91nv6QluFOm+2PVn5iTIlK4SKh3UBxToYYnWOkQInzCqfU7fLAgXbRNe2HV
         Xjtw==
X-Forwarded-Encrypted: i=1; AHgh+RptjMM36Sa/VlolgIesTp0XiiqH8CahAk55U6u6+pxA5KSEIBX+////GqkxlvPcZRg9bcThzZlFzFBIwhCYCMM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyEppDXliKKLeJiSuPbgOVMMsujUF2GqG9nR+hsKpClYe4VkVdy
	qvVagqj5nAvZpjVxtKk71OnpC8Hi1o8KT3fUinxYptR757sIaC8zGKfLfzGGPaK0hcCawUt6URt
	TOFt/7zVIqk+i+pi9v5laaJzooYn1orfIjJq40m0g
X-Gm-Gg: AR+sD11EMmY2iq49WIRUSbJtZoquRusJxSZmlh7btgPTjZwkqKTSZ6XfOM6nFkriNb7
	sRFf+Kmmsqi++1IH6w/xGAQewZj65OEVrt6gNTWl5mS36USKRVvsmFAT+Nz376IRPWV/v28Nj4w
	xXsydirDFRmaotI9BNJpm4z0/8pYEuaoOYgzzN3V4AIYAMrzcqz2ihvXJrgrkrPoQ2hALAknf68
	4VlRFtPha/URfo2rn3TYUJbO9TbBj4D6U/v2nx96mklAkodGZNv9q3eaLafwn0+AjOzar/OCaiv
	jEjr5Ho55pvtg56R
X-Received: by 2002:a05:690c:c453:b0:81e:bf0e:55da with SMTP id
 00721157ae682-81ef260c885mr66446937b3.48.1784709266701; Wed, 22 Jul 2026
 01:34:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260721075226.2347933-1-wenst@chromium.org> <20260721075226.2347933-7-wenst@chromium.org>
 <al9IwVR7Whw2DiXU@ashevche-desk.local>
In-Reply-To: <al9IwVR7Whw2DiXU@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 22 Jul 2026 16:34:15 +0800
X-Gm-Features: AUfX_myMObbdQM6Uou8RDo9wMrLkt0Z3Ce7LljI10q7k1rjjaXzvygc1Ey8OWtE
Message-ID: <CAGXv+5EkcASZ__Cyp4PnwemPd2xAe+WL-ics9jqHLuxWjWyT7w@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] i2c: of-prober: Defer regulator_disable() on
 successful probe in simple helper
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	chrome-platform@lists.linux.dev, linux-input@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 6:24=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Jul 21, 2026 at 03:52:20PM +0800, Chen-Yu Tsai wrote:
> > When a I2C component is found, it's device node is immediately enabled.
> > This triggers device creation and driver binding. The prober will hold
> > the regulator enable reference across this part. If the driver probes
> > synchronously, then it happens within this window. On the other hand,
> > if the driver probes asynchronously, there is high chance that it
> > happens after the prober's cleanup function was called, in which case
> > the regulator would have been disabled when the driver's probe function
> > is called. This would then require the driver to wait 100 ms for the
> > hardware to reinitialize, even if the probe function was just a split
> > second late and the regulator was disabled a few milliseconds ago.
> >
> > Recently, some of the drivers for the component that are targeted by th=
e
> > I2C OF component prober gained the ability to skip waiting for hardware
> > initialization if the regulator was left enabled. This happens when the
> > PMIC has them on by default, or if the component prober left them on
> > after probing the component.
> >
> > Wait a bit of time before dropping the enable refcount on our end so
> > that the actual driver has the opportunity to catch and increase the
> > refcount on their end. The 100 ms delay was arbitrarily chosen.
>
> ...
>
> > +     /*
> > +      * Wait a bit of time for async drivers to probe and increase the
> > +      * regulator enable count. This allows the drivers to check and
> > +      * skip waiting for re-initialization.
> > +      */
> > +     if (defer_disable) {
> > +             dev_dbg(dev, "Deferring regulator disable\n");
> > +             msleep(100);
>
> How was this value chosen?

I just chose an arbitrary round value.

If both the prober and the driver for the probed device (trackpad in
this example) are builtin, the time between enabling the node and the
driver asynchronously probing is between 5 ms and 30 ms, but could
also see outliers exceeding 100 ms.

If you're worried the value won't suit every user, I could make it a
parameter of the simple helpers? And the user itself could be made to
probe asynchronously to not block the main code path.


ChenYu
