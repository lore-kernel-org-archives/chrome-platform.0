Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E484A19
	for <chrome-platform@lists.linux.dev>; Thu, 14 Jul 2022 14:15:59 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id j22so3703147ejs.2
        for <chrome-platform@lists.linux.dev>; Thu, 14 Jul 2022 07:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=46hVWaCjx73rPro0Xd0FsbKaZ9xICZpeUq+VAvR8QyQ=;
        b=dayB62ziv3PB+cXjd896yXhTbMzBeWEoeAdLOopJX3aq6bp9wJob3XuQM4oRVx2yGj
         jdlGCwzxqZDvf9o82U+NtbRAXzRIyVUgp2vK6xJKyAeuexIcrSOL9GLnmEL0wcjy6dGP
         z0sZ7+MgshUe4Qpfgfl90lQkjMqvZXQNGJH7DbZnKOk5WmbLwLWQKBYBuOMknoSeNtgP
         oE/d09iVnYzbbcxU2QIJb1M2KWdMSo804+bh13oLpCXcphiH9mAEt/WptdLMwzQ039JR
         YjY0pp4AdOzFkixAwItFuqfmT0x4gqOnafg3fJ6uxLzSRiGC4a7P8SiEL6SlVN1kjfAl
         vVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=46hVWaCjx73rPro0Xd0FsbKaZ9xICZpeUq+VAvR8QyQ=;
        b=NMGRbadX5XlaDrNqqMlweKvPHq6IwjJBLXTaVQEOYWw7P21n6ww0o42f+KZRMKgUlf
         KyiNpm7d7r7ydv6nZ4f8Rs2Nvelq6M6HDiYscJB0WS2UXRny1gWQUDhLNDsD30xamDPG
         VnxlE85ULozexTrRXYiLmAraY3BtAs6+6VjbTUtVmhhgk8u1L6NNq0uEONRCaOKQAFYL
         Y1JlheHfLRRog3rvQSOe5meYi89khqvL4zmjRFX14uo4P6u2U3XirswUjRza5Q1B/I9h
         BkPbjFCl7aJUpHCPbP55aPPkFkH+55v5vXFKNbBAiC9JwkobmE9C2ZSJyrlZU2B+Slay
         8J1w==
X-Gm-Message-State: AJIora8IWJyR2rHl/lJTksY/Yxq1IqCBoUzfEdtuWNi9sm87Voa5zWhJ
	xBM5QSF9xA7SLopkLOC5/JucUMyGTOnY9wsHWJGskA==
X-Google-Smtp-Source: AGRyM1sOVFTweX/7D10y5LMAzTNLwKU/QG7AHmo8of6n2sVe7xxZ/1fne0BA6TZNHtaZSDp2y9nlrKyYLq6DA/bXoH4=
X-Received: by 2002:a17:907:720a:b0:72b:549e:305a with SMTP id
 dr10-20020a170907720a00b0072b549e305amr8627280ejc.691.1657808158093; Thu, 14
 Jul 2022 07:15:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220628024913.1755292-1-tzungbi@kernel.org> <20220628024913.1755292-8-tzungbi@kernel.org>
 <CABXOdTft0Nu_hJQuXwepBXE3tWZf7jaidGE5mamq_=1Zi4hevg@mail.gmail.com> <Ys+QZyOdIT8d1rvW@google.com>
In-Reply-To: <Ys+QZyOdIT8d1rvW@google.com>
From: Guenter Roeck <groeck@google.com>
Date: Thu, 14 Jul 2022 07:15:46 -0700
Message-ID: <CABXOdTcb2iMfokJL-rHJ5FkUYTyvjbaqooVXud2pfoE-_fEg9Q@mail.gmail.com>
Subject: Re: [RESEND PATCH 07/11] platform/chrome: cros_ec_proto: return
 -EAGAIN when retries timed out
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 13, 2022 at 8:41 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> On Wed, Jul 13, 2022 at 11:18:32AM -0700, Guenter Roeck wrote:
> > On Mon, Jun 27, 2022 at 7:49 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> > >
> > > While EC_COMMS_STATUS_PROCESSING flag is still on after it tries
> > > EC_COMMAND_RETRIES times for sending EC_CMD_GET_COMMS_STATUS,
> > > cros_ec_wait_until_complete() doesn't return an error code.
> > >
> > > Return -EAGAIN in the case instead.
> >
> > Does this make sense, or should it be -ETIMEDOUT ? What does the EC do
> > if it is still busy (stuck ?) with executing a command and it gets
> > another one ?
>
> AFAIK, most existing ECs use single task for host command[1][2].  As a
> result, EC won't reply if it was busying on executing a host command.
> Not sure if it would change after leveraging Zephyr (if enabling multi-core
> support).
>
> EC_CMD_GET_COMMS_STATUS is the only exception.  EC executes the command in
> interrupt context[3].  That's why AP can use EC_CMD_GET_COMMS_STATUS to query
> the status while EC was busying on another host command.
>
> I have no strong preference for the return code but tried to align to another
> timeout case (when cros_ec_xfer_command() returned -EAGAIN for
> EC_COMMAND_RETRIES times).  Do we want to separate the cases: one for -EAGAIN
> and another one for -ETIMEDOUT?

If -EAGAIN is used elsewhere, let's stick with it.

Thanks,
Guenter

>
> [1]: https://crrev.com/4c0ae8814a68f2c2655ebb0b3b80ec4529d07cb3/common/host_command.c#428
> [2]: https://crrev.com/4c0ae8814a68f2c2655ebb0b3b80ec4529d07cb3/board/volteer/ec.tasklist#20
> [3]: https://crrev.com/4c0ae8814a68f2c2655ebb0b3b80ec4529d07cb3/common/host_command.c#176
