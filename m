Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9681BC59
	for <chrome-platform@lists.linux.dev>; Wed, 25 Sep 2024 17:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727284828; cv=none; b=eDtR4+9DRWJc8qhX/eWdQq7TKZykqzdIWc8uHjUSFvrXSfeXw753m5RrQgC1lfyaCEKbt2SutwevOMDPtX8P4jN6LYveYHbdbSlqXPgZ3ysu+VXtpHSv9LI332D4f8me9lFl+ybJb7F3cmEeKD2hep3B7q1Z/XUuaOaePM0AT/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727284828; c=relaxed/simple;
	bh=hQ6Mhx7JIWYkKXo1pfm6XkI5thrxHDL7hWgwl7eQsKM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SnwFcfLSFIIxb2ZIpnNz3LriTIxHr/912VdkJ3K+0vfuZCvuvJC4CbvObc/s5uFS9gbEpheK9uSsAYv54GqU6OE3hU11ELYxumsJrI208hZF8wHzyIesLGswLOgr2QMG74t1rDP+uf0YYvDUoYWD9WU0SqVtkniTRJGxWHF6rhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RpJ7IcEy; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RpJ7IcEy"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6dfff346a83so1076447b3.2
        for <chrome-platform@lists.linux.dev>; Wed, 25 Sep 2024 10:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727284825; x=1727889625; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PafzcKiIYdF6wysKKVXDWlev4TmPRalpGq31nVBCo8A=;
        b=RpJ7IcEyATOBI2x8ORofPcsjXWcPBmXV7h12/rvHGLafZnSZbWCMc4380SvwPOiowT
         XQivGQDO1RrffTGbXT7Fy2xWTnAdKp+nbay1WPMdpqD8Sj9BabGp5YIILkZEj8RfaDtu
         JuhqdfzcRcY6pW+nCfBdjZk2Wnb8KLsCRKGkg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727284825; x=1727889625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PafzcKiIYdF6wysKKVXDWlev4TmPRalpGq31nVBCo8A=;
        b=fNCSOUfCJBJ4xHmrMq1rPCr3hhUC3EzNEzhi1Oe/WDxNo35OmFrl22xf4LOwgKmfLM
         6wrcfG/4Yml4d97QHnClgyMMK7YjfBnMtW9+4Zhv1v/ZU1/45Sko/qs+hZCnia6oiEeR
         xKgMSi+sIIkMva6f1a8TghPYPc/kl1qeVTBzrfUnP22noo6AKkeOLNNPTfPWs3fvUWBp
         iDvwCwl7ptcYvax16PucTrkySxR0/77VamRJWaw2J/vPokjOkgYzuWIuBXyjK6waiwPU
         X1bCqPFVw5DNz9IF6ElgiLoRuHMpzeVQJkNxBm3crdWLI9yxD99u+p5e1z9wu7WI/B5d
         3agA==
X-Forwarded-Encrypted: i=1; AJvYcCUMJSCMWKLEwNeg6leWQdO9NBRYVk/xua+sZjX5bEu/GzXXCpKVs78Hr7urWo1lyKBjJ/hCrmSSn0OyGakB7YY=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywp4lGq7vGTSrntuphHODF//xYHiNBQKiZ+c5RO2p0bWiLPx3Ri
	FJBakdG9qzC5fpDrw65EvHMBS4zKdFkgcjSLyJ9dYIpimp/MqbsV0oRhzBO4Wd0w3YV4COkb5Q+
	yiCvbFZXFsPXy7wyU1r8vh76kLd5qDIwmrlbT
X-Google-Smtp-Source: AGHT+IFjmckSuZuIgDBXmTJDYZfvAetoI6vwE8y2Iqb2LxyaCa3iZ6YcdfrQOslLC71B/t87NgCAsOdDnccL5zxJrrM=
X-Received: by 2002:a05:690c:f10:b0:6be:54e1:f1f3 with SMTP id
 00721157ae682-6e21d0cea24mr38881507b3.0.1727284825475; Wed, 25 Sep 2024
 10:20:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240925162513.435177-1-abhishekpandit@chromium.org> <6flxq7m7fdcpajdg5sthar6xlnpn2b3nzzwgp55jlqrjw5ubge@kdym7c2kv5fm>
In-Reply-To: <6flxq7m7fdcpajdg5sthar6xlnpn2b3nzzwgp55jlqrjw5ubge@kdym7c2kv5fm>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Wed, 25 Sep 2024 10:20:11 -0700
Message-ID: <CANFp7mU8d4LfXD9p4dbdNs0CGPeYnrQdtLheh_LWD2VwT2Vt9w@mail.gmail.com>
Subject: Re: [PATCH 0/8] Thunderbolt and DP altmode support for cros-ec-typec
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: heikki.krogerus@linux.intel.com, tzungbi@kernel.org, jthies@google.com, 
	pmalani@chromium.org, akuchynski@google.com, 
	Benson Leung <bleung@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 10:12=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Wed, Sep 25, 2024 at 09:25:01AM GMT, Abhishek Pandit-Subedi wrote:
> >
> > Hi Heikki, Tzung-Bi et al,
> >
> > This patch series adds support for alternate mode entry for the
> > cros-ec-typec driver for Displayport and Thunderbolt.
> >
> > Thunderbolt support is added by adapting an RFC Heikki had posted
> > previously:
> >
> > https://lore.kernel.org/linux-usb/20191230152857.43917-1-heikki.krogeru=
s@linux.intel.com/
> >
> > A few comments on the series:
> >
> > * The cros-ec interface will not accept any VDOs/VDMs so we simply
> >   ignore any configurations we are passed (i.e. DPConfigure). This mean=
s
> >   the sysfs control of DP lanes won't work.
> > * ChromeOS has two modes of operation for alt-modes: entirely EC driven
> >   or AP-driven from userspace (via the typec daemon). Thus, we never
> >   expect the kernel alt-mode drivers to auto-enter modes.
> >
> > This was tested on kernel 6.6 with a ChromeOS Brya device and compile
> > tested against linux-usb (with allmodconfig).
>
> Please test on top of the linux-usb or linux-next. 6.6 is nine months
> old kernel.

Ack -- I'm going to try to load the upstream kernel on my ChromeOS
device + test.

>
> Also for v2 please consider CC'ing both lists for all patches. Otherwise
> it's hard to follow the changes.

Really sorry about that. I'm using patman to send patches and didn't
realize it would split the patch series between the two. v2 will send
all 8 patches to both lists.

>
> >
> > Thanks,
> > Abhishek
> >
> >
> >
>
> --
> With best wishes
> Dmitry
