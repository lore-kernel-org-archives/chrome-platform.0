Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B3710780
	for <chrome-platform@lists.linux.dev>; Thu,  1 Dec 2022 21:00:53 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id n21so7134520ejb.9
        for <chrome-platform@lists.linux.dev>; Thu, 01 Dec 2022 13:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GjdRTH/tOOqfRcgeR10agDzqdXeX6/1B2Il2FJNpk9o=;
        b=lQLmOg9OjSraxzekZjSgcm0t0iOOSlEZMV9S9mHYGB46UbHRWvnPNYLLg2Pqv5Gy0A
         FazJhKaIxO2+yKoQkR/bHdjEXiSLyVZKy5yv7aiUwvJXuVwBtDkUxF2x4I3SrzXBZIAR
         erJ5ii7VS5paRQ0D2v3aye1xNNntMdS4hBygo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GjdRTH/tOOqfRcgeR10agDzqdXeX6/1B2Il2FJNpk9o=;
        b=C/Yp8DXHj5lFFDA9xkRKllJgN5/fByFbxRbBs0AwL3oIc0wRllnddKfrvzJepvPlfl
         +HqUJF0rG4FZ7n+iVnHDZEhW6LOXp04f8L3ZxceSwfw3/cFeS2ZhBNcXv8kHcvJ21Kyx
         7EGboNX35gHe9O8SNxUbMYyTMOPgxRgLrKl6RfLzlbHCLGRlZ8orVUXWFuGMcD7IkKSM
         p7x47MyoCh7vSqNePpw8lSwGdFSwyLmKoepW2i5iJTUJrGdHoiuyuU2gPepowl6d6Hsf
         VATRzgN+rLYZ9Soq34GUOFUQk56VXWR15FGViAybUkJ385aE4JdN0FM6hgKXGVHfBoxL
         z1KQ==
X-Gm-Message-State: ANoB5plBMdgXVcBGwKPvGyXOgWwBlvEBKXV/pddTo+UIhzN0eyTgCzyL
	7guK6zEResCRsbpPhPRVnHjV6/7oPNV/KTNChUrGng==
X-Google-Smtp-Source: AA0mqf4xWS223It9WE2Z53qJizB+CilQAiqOpQ2gZq3sgi/L6Pj3GgY3E+MHsJOxqyjNQ6hKxA20G2uQ7XLMVzbbQp4=
X-Received: by 2002:a17:906:79d3:b0:78d:b6f7:53c0 with SMTP id
 m19-20020a17090679d300b0078db6f753c0mr44042365ejo.527.1669928451351; Thu, 01
 Dec 2022 13:00:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221130231936.1666390-1-wonchung@google.com> <CACeCKad16bs_f6bLthTAoEL28tPvf1S10WDeM7ugeaS9g7R25w@mail.gmail.com>
In-Reply-To: <CACeCKad16bs_f6bLthTAoEL28tPvf1S10WDeM7ugeaS9g7R25w@mail.gmail.com>
From: Benson Leung <bleung@chromium.org>
Date: Thu, 1 Dec 2022 13:00:35 -0800
Message-ID: <CANLzEksD=dKgPuCUD74b3YQKCApbZKO_t7Q=tyNKONvAOQ89hw@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: Create new USB driver for RGB keyboard
 in ChromeOS devices
To: Prashant Malani <pmalani@chromium.org>
Cc: Won Chung <wonchung@google.com>, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Prashant,


On Thu, Dec 1, 2022 at 12:10 PM Prashant Malani <pmalani@chromium.org> wrote:
>
> Hi Won,
>
> On Wed, Nov 30, 2022 at 3:19 PM Won Chung <wonchung@google.com> wrote:
> >
> > Without any driver bound to RGB keyboard, it may not be suspended
> > properly, preventing USB xHCI to be suspended and causing power drain.
> > Create new USB driver for RGB keyboard so that it can be suspended
> > properly.
>
> This seems like overkill. Can't you set this from USB's sysfs nodes
> like power/control [1] ?
>
> [1] https://www.kernel.org/doc/html/latest/driver-api/usb/power-management.html#the-user-interface-for-dynamic-pm
>
>
> Best regards,
>
> -Prashant

We're seeing some behavior where a bound driver is needed in order for
this USB device to properly enter suspend state. Just manipulating the
power/control and other sysfs nodes for this usb device when there's
no driver in the kernel doesn't seem to affect the device's ability to
drop into a usb low power state.

Also, I synced with Won about this offline, but the primary concern is
not this prism usb device runtime suspending, it's actually it's
ability to enter suspend state during system suspend. Right now, this
internal usb device is keeping the whole system from entering lower
S0iX states because it's not sleeping. This driver patch doesn't
address that yet, but I'd like Won to dig down and see if he can get
it suspending at suspend time too.


-- 
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org
