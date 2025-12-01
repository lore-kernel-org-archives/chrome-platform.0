Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B7B1FF1C4
	for <chrome-platform@lists.linux.dev>; Mon,  1 Dec 2025 08:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764577371; cv=none; b=H9r7zb1eCWmb7lQTPNyENbERMynzmkxJZVHyqkupKTkI9GUtr5ESaDAA7ZU4r8yTicCwp/pkRzedMsJ55cyaOsgsWHLQqme50xqz1PcU+R36P0itst0H08QokrURMNAxbBc5gwj5x/gQtFYJoYjF0noZjs1HZxZjTI+n2fhMDWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764577371; c=relaxed/simple;
	bh=tezhH6g+Oo3Ep2YJM2R5MfJjZnq1NndRUUIAt4C1nnY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PbgVwQrT8N1t+UelgoE7UuHgz3IP7cRkPkmJUrkVrWAvPerll+O3EzhIYM9c84rEAfH0Gmt2GL5JSQOpIaQPmNh6WfOOMu3daTgfqF/nP0biuRq+2IFoMuQSHXwGHowy7T8Ie1bGiO9HuXYynvCDUaExkx+FGDdGBJDzrBFsBaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AmlGzxHq; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AmlGzxHq"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3418ac74bffso2382638a91.1
        for <chrome-platform@lists.linux.dev>; Mon, 01 Dec 2025 00:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764577369; x=1765182169; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6DkKGTzDIQjUjyaKZQTcpj/1tCVQMkC/PnSyMv8/Z4k=;
        b=AmlGzxHqxdiBJNOM2FDYe+E4borWkkE04CWIrTotG672jJT2qJadYU9+5FdxCFSFF1
         ggXeMki8tzBWdigBPwZcAm0WSgIs9chprgGqwhBppIF6oOlNAsf3ZlFcIzt56yC4SbEe
         woxsPtxFq5EKBY3kgWNoZY6jNDsjYKR0CGA3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764577369; x=1765182169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6DkKGTzDIQjUjyaKZQTcpj/1tCVQMkC/PnSyMv8/Z4k=;
        b=rFOTXs9RLrvwKfChL+f2lO2P9y6rH0nYtf8g4aFTzD2wQrc5tvo0V8wIooqKujihkH
         08MxCmHY3gpHBPfsxzXjrHDk2+RWSl7aTexwYs0WNckiW1RqB8CP3unuMj9KKTMl+8Jr
         X12W6Y6x7BMGpQtjHnlHdJGq2JWMVMk3jncSZ/xqY0W1C7Cm4daFg9xlkAnkRKDTB4Fr
         6RNCFIqMRdTJQ0UigOtKDDboFKI0H7cIIMw539h8xKW0cWA/33H7RSxWbw5waJSKNL9O
         FahiS3zJ6wRkduOOsS8Bdla2rKnutGDFijKs2/UO9ADVqTiadnLu/jubjnHyQs6Q1/Ax
         rPZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHY8K3omKA4INP9G+xWss6ZUNH3+OszA/hf8nPfqdDomOVtcF3Md2V3TEXY0IjGuD2Se9pG9m8+u9Y8jNT49o=@lists.linux.dev
X-Gm-Message-State: AOJu0YxaQ4Sh38Y1ZYNnzSlyVjc+BHWRs5iMy2SNcbFhtc8bdo8nlZVA
	UsHM1P32e19x1SKyzyzQiToAJSoglX6tP2lFpNEaeoRZwpTM2R2fu1kHdWTl8e6+gTOC/zrjaDs
	WOMmLliJ+KcBBzE3g8YKob2RalANuqMtj3k+76AxL
X-Gm-Gg: ASbGnctvyM8tDU9oP7GI3XwG3iFs72FWDtLxXvBpmC4CAVs4oGOnpA65sJ6Qx0nl5hT
	TNV0vmtF3yr7K43tNGGHUgd240A7cX9hdVQaFkI3bG2+o0gpTJuXG2lVdKieRSmwphEvzSg0kK4
	vrQXbEPM7BAVkX5j4oHtI/tpP8tce0nE73TdJRk5bjlR09HI+yIFkLYsSYRV3vj1TLXd0H9t5+o
	slNpYNM2XcMkLvX9gtmv1LvfahoDq4fy0WrFRL668Kf/yTACZJtmQGVr02pEDMfAg82Oasg3MZY
	Wle+nOFa1dk+X7QH5Vtjog==
X-Google-Smtp-Source: AGHT+IH9WSUA5mPr1et4ou+6+pf7OYX2I/zBaCmnpZxjq11HhJ+53Hocn79pmbMcGHkJoCXw8NRlWPt/W1Qvgt180Fs=
X-Received: by 2002:a17:90b:4b52:b0:330:7ff5:2c58 with SMTP id
 98e67ed59e1d1-3475ebe7422mr26700066a91.7.1764577369237; Mon, 01 Dec 2025
 00:22:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251124124639.1101335-1-akuchynski@chromium.org> <aSbHHXIFYAqLzxzY@kuha>
In-Reply-To: <aSbHHXIFYAqLzxzY@kuha>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Mon, 1 Dec 2025 09:22:37 +0100
X-Gm-Features: AWmQ_bnNY5HEWFzHIK9AgQ3xZPJYBh875E9LzGBKj698eUubrtrBARNrxshHZZc
Message-ID: <CAMMMRMf7Nk1rAbusWCtjBds=_YMGTJ3Vg_hMmMPmXsBmZmsddg@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] USB Type-C alternate mode priorities
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Jameson Thies <jthies@google.com>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, "Christian A. Ehrhardt" <lk@c--e.de>, 
	Abel Vesa <abel.vesa@linaro.org>, Pooja Katiyar <pooja.katiyar@intel.com>, 
	Venkat Jayaraman <venkat.jayaraman@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2025 at 10:23=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi Andrei, guys,
>
> Mon, Nov 24, 2025 at 12:46:35PM +0000, Andrei Kuchynski kirjoitti:
> > This patch series introduces a mechanism for setting USB Type-C alterna=
te
> > mode priorities. It allows the user to specify their preferred order fo=
r
> > mode selection, such as USB4, Thunderbolt, or DisplayPort.
> >
> > A new sysfs attribute named 'priority' is exposed to provide user-space
> > control over the mode selection process.
> >
> > This series was tested on a Android OS device running kernel 6.18.0-rc6=
.
> >
> > Changes in v5:
> > - Patches 3 and 4 (v4) have been consolidated into a singular patch,
> > keeping the mode priority implementation within drivers/usb/typec/class=
.c.
> >
> > Andrei Kuchynski (4):
> >   usb: typec: Add mode_control field to port property
> >   platform/chrome: cros_ec_typec: Set no_mode_control flag
> >   usb: typec: ucsi: Set no_mode_control flag
> >   usb: typec: Expose alternate mode priority via sysfs
> >
> >  Documentation/ABI/testing/sysfs-class-typec | 11 +++
> >  drivers/platform/chrome/cros_ec_typec.c     |  1 +
> >  drivers/usb/typec/class.c                   | 99 ++++++++++++++++++++-
> >  drivers/usb/typec/class.h                   |  1 +
> >  drivers/usb/typec/ucsi/ucsi.c               |  1 +
> >  include/linux/usb/typec.h                   |  2 +
> >  include/linux/usb/typec_altmode.h           |  1 +
> >  7 files changed, 112 insertions(+), 4 deletions(-)
>
> These are okay by me. I think we can move to the next step. But I'm
> not sure we apply these before that, because the file has no effect
> at the moment.
>
> Br,
>
> --
> heikki

Hi Heikki, Abel, Benson,

Thank you for your review of the series.
I will send the subsequent series detailing how we are going to use
priorities in cros_ec_typec and cros_ec_ucsi drivers.

Thanks,
Andrei
