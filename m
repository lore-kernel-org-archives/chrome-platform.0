Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE656004
	for <chrome-platform@lists.linux.dev>; Thu, 14 Jul 2022 18:19:25 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-2ef5380669cso25402317b3.9
        for <chrome-platform@lists.linux.dev>; Thu, 14 Jul 2022 11:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UalPu2ksuWmPhMJk6j/nedFQH4vb0HRRAL+Epn4qbZ8=;
        b=j4dwcaQHxccsYOFZrXtomfe9hOl6BlVc4DQKsraUI3MJvpEoX61FMcb4nxyZRbRD+y
         SS1TtWDZUdJE1B+TtUsKSI1GUNUMmsL0zWNYoVVMksVTckyC1IYa0j6SdesEOJHPmkl1
         KyDzM+uxVRocoJ+TKjPx5nsaU32fQyQrJp+BGkwL6V5QyOccv1GCuQ8REo4/GYhuh0+P
         KGQxPNRaZzbCGKpY51IBbk0O/s7k931S2m6nM2CVV6ZYSG2TQfWxoKTZjSVLdZ2ydhyP
         To2+Hn+xOGUPAGEHyAAzB4wlp2oUgyRFggJtIs8CeZjVagrVXZRaQNI+c5LIevh68Vjf
         M9YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UalPu2ksuWmPhMJk6j/nedFQH4vb0HRRAL+Epn4qbZ8=;
        b=G+K+/L9NRReuwhJ4FKhABebuOzA58Q5ErDaSSmBAI0GopakFdlTChCwhtkztGM/F7T
         8YRAiThf7UmeiDGzDUXPhSJSR1CzznP1geZyPevaVMd3hf+KtktNbbJo5a5jiFsHbVnf
         +BpoFyN5y3W5gFzbW1WwCs1H2iThvK5qRB/H95zlrXbtGe38do5Xr48je14GKm8C81nk
         GGaIYXcZYVdg9BOpcy8XfIeaGuhLlNyXq0dGEZNTUtYllT5ISw7LGGM/MgEFAnGa+B3G
         FWezjIMp7sVHohmeX97Tc30iJ2pZemHJEFzvCi++nFhKIfq2uv9dN9CawpZeym4jwB3J
         hAjA==
X-Gm-Message-State: AJIora/xzP+CeUFO7UkLayuH+pkmESAwjTi4Sz2sy9DDtoK26qGvW3VL
	L5XtrUlAcvoQJGwSg2Nl7Qp9bnKoAfhOE2ny6x9k4PJg4ELNDA==
X-Google-Smtp-Source: AGRyM1tyJfI1/uNHge25px5/PLanVAieHbxdM60iopHkkljV0nkYyMuYqzY2eroNzQHCTe3fJ7VxxB7ATKaOGnnw3vY=
X-Received: by 2002:a81:4427:0:b0:31d:b9ad:4a7c with SMTP id
 r39-20020a814427000000b0031db9ad4a7cmr10743607ywa.396.1657822763794; Thu, 14
 Jul 2022 11:19:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220706205136.v2.1.Ic7a7c81f880ab31533652e0928aa6e687bb268b5@changeid>
 <Ys40uw4QIe4fQKA/@google.com> <CANkg5eyehcECGeDHBEsxR=iOoyMwzkcpvX+oRxy7PJPYLD=VuQ@mail.gmail.com>
In-Reply-To: <CANkg5eyehcECGeDHBEsxR=iOoyMwzkcpvX+oRxy7PJPYLD=VuQ@mail.gmail.com>
From: Tim Van Patten <timvp@google.com>
Date: Thu, 14 Jul 2022 12:19:12 -0600
Message-ID: <CANkg5exT1kFr9WBQEGD0=ndH1aJMD3OXmuZ4Obx9JtVDgKS6ow@mail.gmail.com>
Subject: Re: [PATCH v2] platform/chrome: cros_ec: Send host event for prepare/complete
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, rrangel@chromium.org, 
	robbarnes@google.com, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[Resending in plain text mode]

Hi,

> Please be consistent.  Either way:
> - .prepare and .complete.
> - .prepare() and .complete().

I'll address this in the next version.

> The patch doesn't allow EC to log anything.  It makes AP emit more logs.

This patch changes when the EC outputs the host command that indicates
the AP is starting suspend and finishing resume, due to the change (in
this patch) when the AP sends that host command.   This makes the EC's
logs more accurate when correlating them with the AP's logs in regards
to when suspend is started and resume is completed.   Previously,
those events were sent when suspend/resume were already in progress.

We'd also like to keep the new logs emitted by the AP to make it
clearer when the AP is starting suspend and completing resume, so we
can correlate it with the EC logs more easily.   This should aid
debugging and timing analysis.   Since it only occurs during
suspend/resume, it shouldn't flood the logs and follows the logging of
other driver PM functions.

> I didn't see concerns in [1] have been addressed.

I replied to the first email stating why we want to keep the log
message (and reiterated it above).   What's the correct process to
indicate we don't want to make the change requested in [1]?

On Wed, Jul 13, 2022 at 12:05 PM Tim Van Patten <timvp@google.com> wrote:
>
> Hi,
>
>> Please be consistent.  Either way:
>> - .prepare and .complete.
>> - .prepare() and .complete().
>
>
> I'll address this in the next version.
>
>> The patch doesn't allow EC to log anything.  It makes AP emit more logs.
>
>
> This patch changes when the EC outputs the host command that indicates th=
e AP is starting suspend and finishing resume, due to the change (in this p=
atch) when the AP sends that host command.   This makes the EC's logs more =
accurate when correlating them with the AP's logs in regards to when suspen=
d is started and resume is completed.   Previously, those events were sent =
when suspend/resume were already in progress.
>
> We'd also like to keep the new logs emitted by the AP to make it clearer =
when the AP is starting suspend and completing resume, so we can correlate =
it with the EC logs more easily.   This should aid debugging and timing ana=
lysis.   Since it only occurs during suspend/resume, it shouldn't flood the=
 logs and follows the logging of other driver PM functions.
>
>> I didn't see concerns in [1] have been addressed.
>
>
> I replied to the first email stating why we want to keep the log message =
(and reiterated it above).   What's the correct process to indicate we don'=
t want to make the change requested in [1]?
>
>
> On Tue, Jul 12, 2022 at 8:58 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>>
>> On Wed, Jul 06, 2022 at 08:51:39PM -0600, Tim Van Patten wrote:
>> > Update cros_ec_lpc_pm_ops to call cros_ec_lpc_suspend() during PM
>> > .prepare() and cros_ec_lpc_resume() during .complete. This allows the
>> > EC to log entry/exit of AP's suspend/resume more accurately.
>>
>> Please be consistent.  Either way:
>> - .prepare and .complete.
>> - .prepare() and .complete().
>>
>> The patch doesn't allow EC to log anything.  It makes AP emit more logs.
>>
>> On the related note, the commit subject is confusing.  The patch doesn't
>> send "host event".  "host event" is a terminology when EC wants to notif=
y
>> AP something.  Also, s/cros_ec/cros_ec_lpcs/.
>>
>> > Changes in v2:
>> > - Include cros_ec_resume() return value in dev_info() output.
>> > - Guard setting .prepare/.complete with #ifdef CONFIG_PM_SLEEP.
>>
>> I didn't see concerns in [1] have been addressed.
>>
>> [1]: https://patchwork.kernel.org/project/chrome-platform/patch/20220701=
095421.1.I78ded92e416b55de31975686d34b2058d4761c07@changeid/#24920824
>
>
>
> --
>
> Tim Van Patten | ChromeOS | timvp@google.com | (720) 432-0997



--=20

Tim Van Patten | ChromeOS | timvp@google.com | (720) 432-0997
