Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39523C3E
	for <chrome-platform@lists.linux.dev>; Tue, 13 Sep 2022 17:17:49 +0000 (UTC)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-127ba06d03fso33991538fac.3
        for <chrome-platform@lists.linux.dev>; Tue, 13 Sep 2022 10:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=DRrSt1g1MwWWIcrp8RvrIGoWocVBN6Pz07Q5HTcSUe4=;
        b=OgNrTzvafqsbqCKy9d8AO957d5rSQDMlcymT2RJaj627dRsLVvZwbojoy3oDjPb2LY
         9kYbZN+9OotFDdln4t7sWUr30bJjf/A+X5uQT5MEgD/otHEy57ZBdTEDrlfsa2l85MtE
         /XtetIM2X/Odqh1MZkDS5gfQCk2qjrZW3aAmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=DRrSt1g1MwWWIcrp8RvrIGoWocVBN6Pz07Q5HTcSUe4=;
        b=dXBgMqLjBvZGnxo8fZwMQ6tPbNc9AdjJTBRHyUQtCGtcqIwyKXWuWRPqVy8WWGsH86
         shgaPPqVsh2WNRz88i+DuY2zYpjF0Cm8TbIpcSh2FccwbxYWj9/sFfJExLNvj1dmNy4N
         0/dBVO0OwrqiYexAw9kbkP3vquzwdTobKajMKQ7kTrA32vhL+goumge5Y5YWVGcK8Hmc
         uLvIX4KY3gD0diuex+jNOW7VsJLBVT309DheK5DcQZ6no+wrmnDn4F9r8nZ2kcfWPkHK
         L5aajmXOa135TkM62pT2qzDmICYTYKQek110ZKuyadA9EKWCLakiMxMw/Q9oF1qPNoRC
         968g==
X-Gm-Message-State: ACgBeo1DakLhG5qysP8jj8Bd+qsMA04fK1Lbx8oA0D5dA0D7EFjuI++P
	ETDUV0t+qLNN1revmAYvleh+1KfQ1pAXXrqeluySDw==
X-Google-Smtp-Source: AA6agR6lGJjOKjRAA18P3LgKh5BJ1kmfGGmXulrZufDWxYKMksK2fHr5gTpOX1MQI/0k7i50uYVHYUMQQIqLU22CZh4=
X-Received: by 2002:a05:6808:3021:b0:335:182f:a66a with SMTP id
 ay33-20020a056808302100b00335182fa66amr137569oib.295.1663089469116; Tue, 13
 Sep 2022 10:17:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220913145549.2839948-1-jthies@google.com>
In-Reply-To: <20220913145549.2839948-1-jthies@google.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Tue, 13 Sep 2022 10:17:37 -0700
Message-ID: <CACeCKadOcKsmpvdtYf5QhUxcMA82angLzZBHx2yZ9QHJPv=bsw@mail.gmail.com>
Subject: Re: [PATCH v3] platform/chrome: cros_ec: Notify the PM of wake events
 during resume
To: Jameson Thies <jthies@google.com>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	bleung@chromium.org, groeck@chromium.org, tzungbi@kernel.org
Content-Type: text/plain; charset="UTF-8"

HI Jameson,

On Tue, Sep 13, 2022 at 7:55 AM Jameson Thies <jthies@google.com> wrote:
>
> cros_ec_handle_event in the cros_ec driver can notify the PM of wake
> events. When a device is suspended, cros_ec_handle_event will not check
> MKBP events. Instead, received MKBP events are checked during resume by
> cros_ec_report_events_during_suspend. But
> cros_ec_report_events_during_suspend cannot notify the PM if received
> events are wake events, causing wake events to not be reported if
> received while the device is suspended.
>
> Update cros_ec_report_events_during_suspend to notify the PM of wake
> events during resume by calling pm_wakeup_event.
>
> Signed-off-by: Jameson Thies <jthies@google.com>
Although I've already provided the tag, here it is again:

Reviewed-by: Prashant Malani <pmalani@chromium.org>
