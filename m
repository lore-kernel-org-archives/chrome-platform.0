Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A841E885
	for <chrome-platform@lists.linux.dev>; Fri,  6 Sep 2024 13:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725627715; cv=none; b=iDI2anQ2D8HPPQYhWhdMpUqgouaKyE8lLJ5icyfZTJ5vNIQ5aj+Ro4XeDFCsxpsw+KALaJdXNe1uFDEmZ0WgikK0b+VLqxsRs1S5ebbA26PUvW1tL26hPZZtEs8CdeT5aSeqdxV4mzTpmpHpbtCYjze7UMuDer5NexZrPtO/dww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725627715; c=relaxed/simple;
	bh=a36nfuHe6Dl2uvLqBUCT5/YEPTuh96aYfsSQlya8Mo4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ds/ipfyNQ6rl/ioIZnMEAiCh+P1ntJbjXrf6jyvs9bQsQ+g6268/oFmN7HPorL2i/RFnA71ligxi5wUsc7ZqVXSC+yJqFdquThG3gpt+TTZV/Qr+kOIZVJUtPPtcQWFX/Cl7evDCy94KWlhbCNcYWh9gG5QNDuRfoi/VU913KwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QFzx5Pgm; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QFzx5Pgm"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5343e75c642so2345541e87.2
        for <chrome-platform@lists.linux.dev>; Fri, 06 Sep 2024 06:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725627712; x=1726232512; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ebm7CEtOskf5reMpVf4B+fPAj2BHCamh5NPhK4/w3Iw=;
        b=QFzx5PgmUyzKn46640MxCvQlImO3S54VGeEk0pzRXzE6CLYGAcrclcV8vldSj7adsQ
         RtQ7NrD3uLsU+yrwKiqCZOWwvX8oBUHcimq8ab+3pPqvWTT8U3NWFuISToz4vBtuyUxA
         iQ2J0Hgl5K6hxZe+A6GSe+uAz2QDNvpM4/DRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725627712; x=1726232512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ebm7CEtOskf5reMpVf4B+fPAj2BHCamh5NPhK4/w3Iw=;
        b=iytmGxPvOCRHb1RItDZ1GIEyTyypEucObI2qS0DdSHuDSAlgTl6Lo+HoBmbW+IQSiL
         G717BGfe5Wg+OWVkLSulo3EkxoE2LCW4ZVAwBHWRD7HAiovLptZCXHTMfSg2IFRt0Svb
         7amCT31p4TiHCp/suCFEU5yuuHtIlIdulw7tm/uH4YDewgmiKuNwhuroYetYrLq/F4MX
         vhqLoeSOnFsed59aODV15jXUdJCBxBjN7cslk2OfrZS8cukuaklGoS86Jzoh+WCgRjvD
         4Nimz/3iyiq8fH7Lzwwr55riyc6ers/WT95fGG1NI4tMHwCyltKqCvQAlF3MgfOQOmDB
         o3zw==
X-Forwarded-Encrypted: i=1; AJvYcCVWwJi9s6OXK6Eg0JK1mb4zDiSYUbQGLOCRFHGk+7WkI6RAGxr0Glrsj7vON9B2k7SeYuGD+HKQ4joOcb0fN88=@lists.linux.dev
X-Gm-Message-State: AOJu0YwqDt62RMvu/0y/OsFfJHn6YdyBawrug4nYwDscYbvvUnJkKwLF
	ruXXA153roLWtaPagifQRURSe96lRUYfc5gLDFvRtMHyQeQUUwBetny6K5iJqphC3eIBURMotm/
	buJzuo26oGI8ZmYZCl5/+ZSvvCx0BZwPfv/4=
X-Google-Smtp-Source: AGHT+IFbsnq2ddYPgTx5GqK9vGZE+Uqpb6HVg5+nuD/YEPznUEqrqZwrmZj8wm1A1nPL7HFG4fXZPv01bjW3R3SEHY0=
X-Received: by 2002:a05:6512:318d:b0:533:d28:b9d9 with SMTP id
 2adb3069b0e04-5365881a387mr1497792e87.58.1725627709465; Fri, 06 Sep 2024
 06:01:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240903163033.3170815-1-ukaszb@chromium.org> <20240903163033.3170815-2-ukaszb@chromium.org>
 <ZtrA3FAKgXOm-FzE@google.com>
In-Reply-To: <ZtrA3FAKgXOm-FzE@google.com>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Fri, 6 Sep 2024 15:01:38 +0200
Message-ID: <CALwA+NbWvomutA_BZ54ZbFX0+_2kzrmj3WaMQ=AtpeBLgoua9w@mail.gmail.com>
Subject: Re: [PATCH v5 1/8] platform/chrome: Update ChromeOS EC header for UCSI
To: Tzung-Bi Shih <tzungbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Lee Jones <lee@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Pavan Holla <pholla@chromium.org>, 
	linux-usb@vger.kernel.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024 at 10:44=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Tue, Sep 03, 2024 at 04:30:26PM +0000, =C5=81ukasz Bartosik wrote:
> > From: Pavan Holla <pholla@chromium.org>
> >
> > Add EC host commands for reading and writing UCSI structures
> > in the EC. The corresponding kernel driver is cros-ec-ucsi.
> >
> > Also update PD events supported by the EC.
> >
> > Signed-off-by: Pavan Holla <pholla@chromium.org>
>
> It needs your S-o-b tag at the end.  See [1].
>
> [1]: https://www.kernel.org/doc/html/latest/process/submitting-patches.ht=
ml#when-to-use-acked-by-cc-and-co-developed-by
>
> > --- a/include/linux/platform_data/cros_ec_commands.h
> > +++ b/include/linux/platform_data/cros_ec_commands.h
> > @@ -5012,8 +5012,10 @@ struct ec_response_pd_status {
> [...]
> >  struct ec_response_host_event_status {
> > -     uint32_t status;      /* PD MCU host event status */
> > +     u32 status;      /* PD MCU host event status */
>
> Even though ./scripts/checkpatch.pl dislikes it, but please don't do that=
.
> The header is a re-import from EC's repo.  We should try not to be diverg=
ent
> from the origin too much.
>
> > +/*
> > + * Read/write interface for UCSI OPM <-> PPM communication.
> > + */
>
> Same reason: it'd be better if it can align to [2].
>
> [2]: https://crrev.com/1454f2e8dac20ca37428744345c1bb4fdec30255/include/e=
c_commands.h#8055
>

I will do.

> > +#define EC_CMD_UCSI_PPM_SET 0x0140
> > +
> > +/* The data size is stored in the host command protocol header. */
> > +struct ec_params_ucsi_ppm_set {
> > +     u16 offset;
> > +     u8 data[];
>
> Same for the u16 and u8.
>
> > +struct ec_params_ucsi_ppm_get {
> > +     u16 offset;
> > +     u8 size;
>
> Same here.

It was a comment from Greg no to use uint*_t types but I agree the
changes I made are inconsistent with the rest of cros_ec_commands.h
file.

Greg would you be ok to stay with uint*_t types in cros_ec_commands.h
to be consistent with the rest of the file ?

Thanks,
Lukasz
