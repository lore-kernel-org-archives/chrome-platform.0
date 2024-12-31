Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244A615573F
	for <chrome-platform@lists.linux.dev>; Tue, 31 Dec 2024 12:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735649590; cv=none; b=Oubqvyszz7lcdmxSL2Xvao6WX1Vl7P+qoVBhs0Z8pm6dee/hPlaPet6xk7OF+6APYx8FLvKfqB6p84Ufpwca2lWa80picamRs0dyYvyGkqfNTFP8hiGm2AlvlsFxWxSnt7i+Rd9hZMovBbam4b8SP8nwSMxVdkBOoYGfmlkUyl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735649590; c=relaxed/simple;
	bh=mHgMfzIy6Z8Ln5l7csbV5A8Il3cuympWdAIQVuINgJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fU0QBsgQTx+YgvAGIk2//LnmLVKbD7AJeLppoKI+wCUDc5dlzVstcwUwR80+XTS3/+GCwuc1hnTcKui27O4S7RLmcvY3ENcyLlJq4mOC+kbUlSHuuaCaJ6Jxti0zyA9t8IjW7JRQGGY1Pl/+wpYkcxdsgyQDy2W90S9uTUAGdg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AajMhhNR; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AajMhhNR"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3022c61557cso140510951fa.0
        for <chrome-platform@lists.linux.dev>; Tue, 31 Dec 2024 04:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1735649586; x=1736254386; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UY6vVA4LyUqtSVdwehSSHUM9l1vc+Xv02RXTSBH2nIE=;
        b=AajMhhNRPfAPoxxhpK/ZQ8zdfCXR2UgTzznJBHBz2xM7WS5+CmvQ6+LfzrYXJFxlbo
         3B2R+H84N0WxMEaY35+kb3A7ycRrJQPiUIAor96kYJq9EAr4TBxiByuqAxhNCBDibhCh
         M9Kcf5VprjyCI0cZVfPgVrnax+zRdNaEZBxWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735649586; x=1736254386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UY6vVA4LyUqtSVdwehSSHUM9l1vc+Xv02RXTSBH2nIE=;
        b=vnczbRwmh6KzsdxJY71CCoHb0msAxR+PCJDNZdgZmbryeovaj7dtCIu04cOjkh5GB2
         wwJpQvhHOusWTRJM+3it7wL2enp8WhU4Lg5Y/4WEcQXaJtqSs3Y3FfxUUg5gUCBtT/3k
         512LQsw908U/+CwT0dYK0XRYQBO+TrV/WliU2aQJlEoYyE2TtftNpMPr8pN4MzwQbDNr
         JMfgiGis7nVhePLwyv4jDeqFU+qQzxwWiRQ7YyRygAw/95IUPJryAfxOXJNL+84uu1B3
         kDlbzo112E//gjlJJs+wbSWGUqze8X/NNkfrlFQQbK9yv1JmzdhwjfuezNqw1m7RopSc
         a19w==
X-Forwarded-Encrypted: i=1; AJvYcCUnpoNB8yfXXsVZhKhjF4YW8bQZBhj4y1BN6xeISAuoBZcstRL8/2/NuArQ6IxqQnxLJui+53XOBMX83Fv0gUY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzgr7oMZMa35MB1BMirCYs9P4n/l2XuWCy7Uk9JeubRlow2Ms3l
	Zj+bH/r50m7JyUCBAD/1zR6Cffz/yhU5IjpJYVTdOY9hfmq/XlI4tL61o95DIcll3Lub0QJeHDT
	5yRYjGRjZiqCdGsti0SPh6KbNKpTkMJmKEOg=
X-Gm-Gg: ASbGncvU84Kx7fFPQuhfIF9DI414xWLBR8dY6+eM5dt+geaM6OzQCDiFG3TPRQ0hmvS
	sbm4peBviwz7xKFXA55paL6oGh4YH4Xpvdrweo/L2v9ScmnMbiLISRBhHKhKKRQp3
X-Google-Smtp-Source: AGHT+IHiwVcJE1fyzGyiAhI/TbDO2ITJnQrx87hjj+3eBLt7Okgpz0KALafRb0edl/pzyfeIvWCljmtHVBDAM66EcAg=
X-Received: by 2002:a2e:bc2a:0:b0:302:40ec:a1b9 with SMTP id
 38308e7fff4ca-30468548c00mr109866921fa.5.1735649586212; Tue, 31 Dec 2024
 04:53:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241210144527.1657888-1-ukaszb@chromium.org> <20241210144527.1657888-3-ukaszb@chromium.org>
 <2024122433-aids-varnish-8a5b@gregkh>
In-Reply-To: <2024122433-aids-varnish-8a5b@gregkh>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Tue, 31 Dec 2024 13:52:55 +0100
Message-ID: <CALwA+Nb8U9Ff-BaDqonNNvv6U7t=+-mvqP+VAixQWpRsEAWERQ@mail.gmail.com>
Subject: Re: [PATCH v11 2/2] usb: typec: ucsi: Implement ChromeOS UCSI driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Benson Leung <bleung@chromium.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Jameson Thies <jthies@google.com>, 
	Pavan Holla <pholla@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 24, 2024 at 7:57=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Dec 10, 2024 at 02:45:27PM +0000, =C5=81ukasz Bartosik wrote:
> > From: Pavan Holla <pholla@chromium.org>
> >
> > Implementation of a UCSI transport driver for ChromeOS.
> > This driver will be loaded if the ChromeOS EC implements a PPM.
> >
> > Signed-off-by: Pavan Holla <pholla@chromium.org>
> > Co-developed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > Co-developed-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > Signed-off-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > ---
> >  MAINTAINERS                           |   7 +
> >  drivers/usb/typec/ucsi/Kconfig        |  13 +
> >  drivers/usb/typec/ucsi/Makefile       |   1 +
> >  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 337 ++++++++++++++++++++++++++
>
> Given all of the 0-day reports I now have in my inbox for this driver,
> I'm going to drop this series from my tree.  Chromium developers, please
> do better testing, these are simple build issues that you all should
> have caught way before version 11 of the driver :(
>

Hi Greg,

This is indeed lame on my side. But on the other hand it is a good
lesson learned that sticking
to one config/compiler as a verification method of patches is not
enough. I was surprised when I verified
why I missed this failure because it turned out in my environment
clang didn't even posted a warning for the issue
  CALL    /mnt/host/source/src/third_party/kernel/upstream/scripts/checksys=
calls.sh
  CC [M]  drivers/usb/typec/ucsi/cros_ec_ucsi.o
  MODPOST Module.symvers

Anyway I have prepared patchset v12 with the fix and verified that all
the failures reported by the 0-Day CI passed:
https://lore.kernel.org/linux-usb/202412240743.tzTftk4H-lkp@intel.com/
https://lore.kernel.org/linux-usb/202412240903.xAqTOQpa-lkp@intel.com/
https://lore.kernel.org/linux-usb/202412241137.ld79A9Iq-lkp@intel.com/

Sorry for the inconvenience.

Thanks,
Lukasz

> thanks,
>
> greg k-h
