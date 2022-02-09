Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3DB2F23
	for <chrome-platform@lists.linux.dev>; Wed,  9 Feb 2022 03:31:54 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id i21so481851pfd.13
        for <chrome-platform@lists.linux.dev>; Tue, 08 Feb 2022 19:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Nm1MhDiI7ACoH1isbwKzuaKIm3CJ2CO2yAwTgo4zGJk=;
        b=kwyPIA8EWByHJHhMVfppWnBxtF3QcD13PaBI5rdfaENrQgBWfvqL6YSlZtQwhmJq0Z
         tuhPmt+oprwxq0EInA4/+brjf6wHfqUB+32bl1xSbtGxsLyBUqDfdybaphiUqddncfHG
         Mbo2jEmUnPagMQ756cNld1u4eOu25tlL8zIQXDfPYtjsJF+Tp64LoODMZNozk+n9erLa
         jWMlNGkhbN417gsgV3u184szVbtzZzRsa6i9YbEVUT2mOyl0ARtaeI1erWzTdBar8O0M
         ylpSW0v8lAEraRaZ+mdiL3frPXTxOtStqKdXNmcUrbV4vQAhC7qxu2JM4bKtMB6LcEVZ
         Fz9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Nm1MhDiI7ACoH1isbwKzuaKIm3CJ2CO2yAwTgo4zGJk=;
        b=y45z+HWeHPbAfc9SyjMwq1CoHwkTSaWEPpMWzlO3WVTlGQuIk9ybAi1/mPavnElWqp
         i2vN9OCkBtflpsP6Nlam3jlf+c8AlikKg4s/lbnWlJOmzOQaiPJWOPzwyFwjEDDvxwSi
         N+1F7kQb8PcoXuoVZsu4e3lvUZwTIpUlf245RsrxoUdxh4gWAS56TWl4cOMv3dFbsxlS
         p71F9N68eCFWn3utTkQ3KJLltqhErm8UbLxUus3N9WnHbFDQSz3Wh/VuDfncXk9G0/Qw
         mGM13JqIKFm4TArWEhGdRQYyq+Wn6PBdRvDxxPJfoAKfuuux1o9A0icav1AwMVlDM8g7
         QWtw==
X-Gm-Message-State: AOAM531EM9iSJ8yao8fOasopEIZ5XryRbx7uDUaEQLcCmRJ8EZhQksH/
	bbErFSbgZNciSSkMf21A7AuDYg==
X-Google-Smtp-Source: ABdhPJzrgWHaTE7DCxTP2Ukf5PB8XE7cA8htaCjEpV284mIxWtbOGk1GuU5hQRMvjPNu/XXWb5KUdw==
X-Received: by 2002:a05:6a00:1c5e:: with SMTP id s30mr284243pfw.43.1644377513631;
        Tue, 08 Feb 2022 19:31:53 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:4b6f:f14d:be50:86a])
        by smtp.gmail.com with ESMTPSA id nl12sm4827508pjb.1.2022.02.08.19.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 19:31:53 -0800 (PST)
Date: Wed, 9 Feb 2022 11:31:50 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	"open list:CHROMEOS EC USB TYPE-C DRIVER" <chrome-platform@lists.linux.dev>
Subject: Re: [PATCH 3/4] platform/chrome: cros_ec_typec: Configure muxes at
 start of port update
Message-ID: <YgM1pjwN2MHaMQCJ@google.com>
References: <20220207214026.1526151-1-pmalani@chromium.org>
 <20220207214026.1526151-4-pmalani@chromium.org>
 <YgIBv2SQdwXm7RLt@google.com>
 <CACeCKaezRNgsqrq3QJ1ViHjYScFrjpC-kCaYmE8kOXCcW9MRrw@mail.gmail.com>
 <YgJQ30D8nc4LWvUy@google.com>
 <CACeCKaf4+jxSkKFqx9g3YSPWj-FkbL=jrmHE3YEu7oU0ySPJ4Q@mail.gmail.com>
 <CACeCKadujMj4pJqf_jNNmO4UkQinw9QNu_MXe5zkTySUn6R=dw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACeCKadujMj4pJqf_jNNmO4UkQinw9QNu_MXe5zkTySUn6R=dw@mail.gmail.com>

On Tue, Feb 08, 2022 at 02:58:51PM -0800, Prashant Malani wrote:
> On Tue, Feb 8, 2022 at 10:35 AM Prashant Malani <pmalani@chromium.org> wrote:
> > In general, I think you may benefit from reading:
> > - The entire cros_ec_typec driver
> > - The EC Type C state machine [2] and interfaces [3][4]
> >
> > The above 2 will help understand how this entire stack works. Without
> > it, it is challenging
> > to process the flow (just from code review).
> >
> > If you have further questions our would like to better understand the
> > drivers, feel free to reach
> > out to me over IM/email. I don't think public list code review is the
> > best option for this
> > sort of explanation.
> >
> > [1] https://elixir.bootlin.com/linux/latest/source/drivers/platform/chrome/cros_ec_typec.c#L549
> > [2] https://source.chromium.org/chromiumos/chromiumos/codesearch/+/main:src/platform/ec/common/usbc/
> > [3] https://source.chromium.org/chromiumos/chromiumos/codesearch/+/main:src/platform/ec/driver/usb_mux/usb_mux.c
> > [4] https://source.chromium.org/chromiumos/chromiumos/codesearch/+/main:src/platform/ec/common/usb_pd_host_cmd.c

Thanks for the link pointers.  It would take me some time to understand the
background for reviewing the patch though.

But in general, I would suggest to change the title for a stronger signal
that it fixes something (per [1]).  Otherwise, the title and the description
in cover letter looks like a move refactor.

[1]: https://patchwork.kernel.org/project/chrome-platform/patch/20220207214026.1526151-4-pmalani@chromium.org/#24727676
