Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED38810782
	for <chrome-platform@lists.linux.dev>; Thu,  1 Dec 2022 21:45:28 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id jr1so2725390qtb.7
        for <chrome-platform@lists.linux.dev>; Thu, 01 Dec 2022 13:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3Q/o/4Z0noIcO+JxjS5cRgrs8K8HqcdCL5GKQbuoq6A=;
        b=I9jY2HMZHMNYPnPL/nM3HJtZaIg/7kAOlEsRt6Nj3N8ngJtoWN7ZOIOWGDO4vX0K+8
         FTdanY4u5e5/dAE6HBUnslqZ6vuNcPjRQM3JMKKFwASlFyddjZOGmU9510sZQd8TaYDx
         L3/hUR21sQis+mGBBv6JERXNitrGq7RNzhRAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Q/o/4Z0noIcO+JxjS5cRgrs8K8HqcdCL5GKQbuoq6A=;
        b=Ccz7pII+OBZBUn8hGE/i43xFzAEfMPjWkP+8iaKecukd0v2+0aqrwVXiCdOaVCoB77
         26T6aeNpWfZgn4l1UhOThDVBzP0SJ0JcfqEwCbo46LR22GydvNyjtfHkOjffOyY6rO71
         X37zdOju7Iuzr5gP3cxLlSpzhw902LKou7f7/E0ONO7qAaiUVA25XSgLcGbZBGnM/4pq
         oONgccidsqRgJdaxvqAnt1ArL2EMYOvqAGeBn10EScZ8yxWaKtBZOlZKe4kYhxaX26y3
         SoKb6Z9DtEnSyKlvIOm0QYT2pR3p7h2hpRG1xKIs3zf0XYNw636tyrY2QrKYxpf8w1t4
         bMhw==
X-Gm-Message-State: ANoB5plD9pp+/bzDUIjr1jx5BlLkR/rmGNQ/eTACVzzkoi1J6Bf0dp99
	nbgckJvxeWfNvDpv5cntW31/ctYfV33JiX/URq3tcg==
X-Google-Smtp-Source: AA0mqf50epzbBUIPTodbZKuNfTiYJv6BUJC3Wm/CKvZTJkVdw9lxmUqDOGaYKdBetNOxDbs2UEYV3jATRJ4F00Jw0+g=
X-Received: by 2002:ac8:4a13:0:b0:3a5:b4ab:cb80 with SMTP id
 x19-20020ac84a13000000b003a5b4abcb80mr37531872qtq.59.1669931127887; Thu, 01
 Dec 2022 13:45:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221130131245.v8.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>
 <CACeCKacHWPVv=sDo5-VjpckvvFw6YmqvXCyLqzgbXBmG080mmw@mail.gmail.com>
In-Reply-To: <CACeCKacHWPVv=sDo5-VjpckvvFw6YmqvXCyLqzgbXBmG080mmw@mail.gmail.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Thu, 1 Dec 2022 13:45:17 -0800
Message-ID: <CACeCKafaZNqtKb8=thALgX4yaVTqsPcGQsHEKUZEVB0XWaNMKg@mail.gmail.com>
Subject: Re: [PATCH v8 1/3] platform/chrome: cros_ec_uart: Add cros-ec-uart
 transport layer
To: Mark Hasemeyer <markhas@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Raul Rangel <rrangel@chromium.org>, 
	Bhanu Prakash Maiya <bhanumaiya@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Sorry, one other thing:

On Thu, Dec 1, 2022 at 1:12 PM Prashant Malani <pmalani@chromium.org> wrote:
>
> Hi,
>
> On Wed, Nov 30, 2022 at 12:13 PM Mark Hasemeyer <markhas@chromium.org> wrote:
> >
> > This patch does following:
> > 1. Adds a new cros-ec-uart driver. This driver can send EC requests on
> >    UART and process response packets received on UART transport.
> > 2. Once probed, this driver will initialize the serdev device based on
> >    the underlying information in the ACPI resource. After serdev device
> >    properties are set, this driver will register itself cros-ec.
> > 3. High level driver can use this implementation to talk to ChromeOS
> >    Embedded Controller device in case it supports UART as transport.
> > 4. When cros-ec driver initiates a request packet, outgoing message is
> >    processed in buffer and sent via serdev. Once bytes are sent, driver
> >    enables a wait_queue.
> > 5. Since ChromeOS EC device sends response asynchronously, AP's TTY
> >    driver accumulates response bytes and calls the registered callback.
> >    TTY driver can send multiple callback for bytes ranging from 1 to MAX
> >    bytes supported by EC device.
> > 6. Driver waits for EC_MSG_DEADLINE_MS to collect and process received
> >    bytes. It wakes wait_queue if expected bytes are received or else
> >    wait_queue timeout. Based on the error condition, driver returns
> >    data_len or error to cros_ec.
> >
> > Signed-off-by: Bhanu Prakash Maiya <bhanumaiya@chromium.org>
> > Signed-off-by: Mark Hasemeyer <markhas@chromium.org>

It is not clear who is the author of this patch. I'm guessing it is
Mark Hasemayer, since
they're the sender, but in that case their Signed-off-by tag should be
first [4].
If it is Bhanu Prakash Maiya, then the git commit should list them as
the author.

Also note that for patches which are developed by > 1 person,
Co-developed-by is an option
to share attribution.


> [1] https://www.kernel.org/doc/html/latest/process/coding-style.html#commenting
> [2]  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bdc48fa11e46f867ea4d75fa59ee87a7f48be144
> [3] https://elixir.bootlin.com/linux/v6.1-rc7/source/include/linux/wait.h#L510
[4] https://www.kernel.org/doc/html/latest/process/submitting-patches.html?highlight=signed%20off#sign-your-work-the-developer-s-certificate-of-origin
