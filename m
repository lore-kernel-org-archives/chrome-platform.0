Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33482FC029
	for <chrome-platform@lists.linux.dev>; Fri, 22 Aug 2025 12:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755867152; cv=none; b=Sze7aKUaim4sFXWdwbUJQTDVF6EkqYTyMfSkVCErjMxEhO4Sm6gsHS/NtZtD11k9nL0yIjKax9CyQ5wrLgz92Ats4XB75wb8ZlRJtsxPSa1j76G+VpeJRJir4BaewPR8NHU+HHdYCrwyn993rTvNbRjKKPlavgTObOpc4RyQqIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755867152; c=relaxed/simple;
	bh=Qvkm8ZvcKVj/gdX6BAq0K2JgptBY3L/xiu5D9dt3b90=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OJSQQ3j4IgXCisSNglsUc4sj6wZsO5+COY3hn8ksTzsbd0lw0JTNxtz1leVzMSnVI4OByDhD+mAfZqFIOrMeNzP4+X3cr2dE26RokJNvyk0Ystk3G1SXSMw+Gs8HU8+HOVG7+RPNyKSBnw3olPG7R9HVvrK1af9wsu6g69w86L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kz3sIKDT; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kz3sIKDT"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-76e2e60433eso1555916b3a.0
        for <chrome-platform@lists.linux.dev>; Fri, 22 Aug 2025 05:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755867138; x=1756471938; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yPWZ0k713TIq/QYfMNdmSvfN5q6KC+M5vfGH3Fh2z5k=;
        b=kz3sIKDTYXizABs5X7wH+Dc0m5JhKOpQE7EspuKhy1yetnNx0um9AQKfu3C0Ev2tXk
         V/x5SQTBnZAIr+QhO5mrjVZ5RBqPqmYFTNAgX7Q0KBf4mCgpRVofgZxD0k5MUyYn4vti
         r/Cm1SqVcz4eJSJKxv4Zdh7EAxCLIoCpJAeQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755867138; x=1756471938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yPWZ0k713TIq/QYfMNdmSvfN5q6KC+M5vfGH3Fh2z5k=;
        b=dqhINxhaxWYSm9MXD5zQqu2/oidK31kysnm6tBo5XeSJ6NjgtAmUoIRCDJiUkqTtEx
         mHRQ08XuwcPNo6kzgbxI+Dfb3Q8vFxuJtudgYM8QN1aKVgno/r9185ZnVvCUzCUbTlJL
         joJsDNseVJXQDeZlWxYcptfNJ6JaHBeIxElzi18gYp/FUVFk7EQ/fRHUycK3fSs8b5pg
         2sz47p3BFW7hNdTJFTOQzwOXDcYtd8lsZkqS6cqkGCgwO7RwKPaOo/5w5KgN0wbupjsG
         CLIubNJOGWCx+aYrvR4n3YvaiFTh/9jZ6F+ujO1f9pn1Z+YzQR6C4+EslrEMS/SU8Zk+
         pz/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXQDqBLZVx5hyIohLERe6nuLFiilM3WBGvMYYOcvVLdIYKkzTDf69o274uE3NKN5ukNSi4NW9WsONz3cRUxBZA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyeNP9ALCmaLH0oRw8p1lNTTmsxCLefhV2oTQChryk24/c1M/Y0
	jdwUGw+Qmr4q7q2YevitfhRWaltxWh1aO5zNzv8RUIN7a9f+J9qJ9CHe0jGqiUuODRb2mJ+nJKP
	GM0y3eeK3+but+SHZsyRKrclsqHpNGa0AqBFOk9m6
X-Gm-Gg: ASbGncvIRhKEM4xtgdJeHe/VHigrxcJ5EevXcCs1M5yhlHGy6ABNMvtAZzbHyay6Gvg
	3m4mkBgl+Xi2sX7NO5aedxyhW0LX9fG7AZ9tIBf+zGZeX4KVSrztxdMEa7YPqT8z+djTmXWT1rL
	zD3X/mwchvdsuTzYjvcXBqfsLFLfqTvc2/qXfHk7hWgXg8zoxtzYhUJt8zBVDdaADuCb/TpjCCB
	JQlrgBzzLNmbnEAvwyA13JIs7FkxFIZy7xQTyqw1U1B
X-Google-Smtp-Source: AGHT+IGRt7T15g4J9TtJHeozRsfP6YTUMgnhVNdFI3+HALeg7CoNfApLp63yXeFIxoeJ6WrrgpylLU3LPWYlGugAkhs=
X-Received: by 2002:a05:6a20:430b:b0:23d:54bd:92e6 with SMTP id
 adf61e73a8af0-24340d02428mr4351745637.29.1755867137998; Fri, 22 Aug 2025
 05:52:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250814184455.723170-1-akuchynski@chromium.org>
 <20250814184455.723170-5-akuchynski@chromium.org> <aKbwby7OYdUpLvhA@kuha.fi.intel.com>
 <aKb_rwVqqzipHHqf@kuha.fi.intel.com>
In-Reply-To: <aKb_rwVqqzipHHqf@kuha.fi.intel.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Fri, 22 Aug 2025 14:52:05 +0200
X-Gm-Features: Ac12FXx3ANTUMIa8Fow-ciMNUPql3vLmAiHYubi-qOYKb8F15LFr1nZlCVhH7cs
Message-ID: <CAMMMRMc6YYpQMo0hDqvjVwg28tTazJxxxgQ5j9iUq-ZWeYg6qA@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] usb: typec: Implement alternate mode priority handling
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Jameson Thies <jthies@google.com>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, "Christian A. Ehrhardt" <lk@c--e.de>, 
	Venkat Jayaraman <venkat.jayaraman@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 1:15=E2=80=AFPM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi again,
>
> On Thu, Aug 21, 2025 at 01:09:57PM +0300, Heikki Krogerus wrote:
> > > diff --git a/drivers/usb/typec/mode_selection.c b/drivers/usb/typec/m=
ode_selection.c
> > > new file mode 100644
> > > index 000000000000..8a54639b86bf
> > > --- /dev/null
> > > +++ b/drivers/usb/typec/mode_selection.c
> > > @@ -0,0 +1,127 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Copyright 2025 Google LLC.
> > > + */
> > > +
> > > +#include <linux/usb/typec_altmode.h>
> > > +#include <linux/slab.h>
> > > +#include <linux/list.h>
> > > +#include "mode_selection.h"
> > > +#include "class.h"
> > > +
> > > +static const char * const mode_names[TYPEC_ALTMODE_MAX] =3D {
> > > +   [TYPEC_ALTMODE_DP] =3D "DisplayPort",
> > > +   [TYPEC_ALTMODE_TBT] =3D "Thunderbolt3",
> > > +   [TYPEC_ALTMODE_USB4] =3D "USB4",
> > > +};
> >
> > You only need string for USB4. The altmode names come from the drivers.
>
> Sorry, that won't work with port altmode. But you can still do the
> lookup with just the sid.
>

Hi Heikki,

I can get names from altmode partner. Names are only needed to
provide results of entering the mode. No partner - no results.

>
> I think this needs to be simplified. You don't need this elaborate
> implementation in the beginning.
>
> I'm going to do some suggestions. I don't know if all of them work,
> but hopefully you get the idea how I would like to see the initial
> support to be implemented.
>

I checked your suggestions. It looks like all of them should
work. Thank you!

- priority is a member to struct typec_altmode
- use svid instead of enum typec_mode_type
- no list or other variables in struct typec_port.
- struct mode_selection_state will be introduced in other series

>
> The default priorities is an array of svids. And I really think that
> the highest priority should be 1 not 0.
>

I think your idea of setting priorities based on the order of
port altmod registrations is better. We don't really need default
priorities in this case.

>
> No driver so you would need to use the mode_names, but instead of
> doing that, just don't limit this at all.
>
> If there is no name for the mode, use the svid.
>
> thanks,
>
> --
> heikki

What if we later create typec_USB4 driver, similar to the
existing typec_displayport and typec_thunderbolt?
This approach could unify how various modes are handled,
eliminating exceptions for USB4 or any other mode.

The port altmode would contain priority and support "enter" and
"exit" operations, while partner altmode would handle "activate"
and name field. I've explored this approach with cros_ec_typec
driver, and it appears to be a promising way to manage USB4 as
alternate mode.

Thanks,

Andrei
