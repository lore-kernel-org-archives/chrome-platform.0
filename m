Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771A114AAF
	for <chrome-platform@lists.linux.dev>; Tue, 29 Aug 2023 20:47:49 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-50043cf2e29so7536799e87.2
        for <chrome-platform@lists.linux.dev>; Tue, 29 Aug 2023 13:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693342067; x=1693946867; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ki20NgIKQhPJbKEH+X1Ki0pzE8kY5+/jmra4p7XJ/qQ=;
        b=XMYFkiejexykglGJq/VKbgxE1UgVE+ie95tAzWJyGd/iyjb29TVsR8zCCVq7Qv16z6
         EsLup5Qoy9YReSt+JMseYD5oLI68ZdI5XYJ6svUlgxfitO4CV60D/gvc4H4SKTQC4UA/
         Sh6I1VSx61VrvFIJWzzjbOtnenzBV7lYRC4GE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693342067; x=1693946867;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ki20NgIKQhPJbKEH+X1Ki0pzE8kY5+/jmra4p7XJ/qQ=;
        b=KmtEh7mDguBNguaIXMrQtxO06LABefa7wW8PKmklMnKndcq+DTaK3QeNCqCfbxZYPu
         OVKmxd2seHX3X3QSGQwxdW1s1byPpcObDQGn7bDpCpl1cVcmnsen5JbA2kBdJSyOvuH7
         osNlObv3xYP1o0XiaBdO2wx5uJrwIJJorVjQjvFjbbAciChAYoeHkMd1YYvT/2lwV/ZO
         5MzmnJfoaWn0vP/RUM8h1sj73Z/e/RZXSEjr/MEz7FRbcsHBpnvyix1LsLmHLmA3KK72
         zhKZbJN8MlPkQzXD4/qR4TowYy3YvF0g0G+eYIva1F9nlKQgTW7qz0MrLg8RKDM5GJ5g
         XyiA==
X-Gm-Message-State: AOJu0Yzgv44umg6/wtiUm6Pnjx2Y9tTtBcRRJt3oJv00aas+2fGexLTu
	M4wHz9YnM9QEPZ9PovmMdxvnvdLNZGRiGvRNJFS8cA==
X-Google-Smtp-Source: AGHT+IHvV0xjYkZ59GGkSoCx9wwb0Zm3Y6TKNWjMt1TL8chPCHnRNNl0RAggvHb9x1w+P7BNB5JUsZKz79SLnBYK+DU=
X-Received: by 2002:a19:6557:0:b0:500:aa41:9d67 with SMTP id
 c23-20020a196557000000b00500aa419d67mr50520lfj.8.1693342067249; Tue, 29 Aug
 2023 13:47:47 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 29 Aug 2023 15:47:46 -0500
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230829030622.1571852-1-tzungbi@kernel.org>
References: <20230829030622.1571852-1-tzungbi@kernel.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 29 Aug 2023 15:47:46 -0500
Message-ID: <CAE-0n50pkiQ=WO-EXmMPB_YBj6Vz1k1BkgkyqKH7BK+YpeV30g@mail.gmail.com>
Subject: Re: [PATCH v2] iio: cros_ec: fix an use-after-free in cros_ec_sensors_push_data()
To: Tzung-Bi Shih <tzungbi@kernel.org>, bleung@chromium.org, groeck@chromium.org, 
	jic23@kernel.org, lars@metafoo.de
Cc: chrome-platform@lists.linux.dev, gwendal@chromium.org, 
	linux-iio@vger.kernel.org, dianders@chromium.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Tzung-Bi Shih (2023-08-28 20:06:22)
> cros_ec_sensors_push_data() reads `indio_dev->active_scan_mask` and
> calls iio_push_to_buffers_with_timestamp() without making sure the
> `indio_dev` stays in buffer mode.  There is a race if `indio_dev` exits
> buffer mode right before cros_ec_sensors_push_data() accesses them.
>
> An use-after-free on `indio_dev->active_scan_mask` was observed.  The
> call trace:
> [...]
>  _find_next_bit
>  cros_ec_sensors_push_data
>  cros_ec_sensorhub_event
>  blocking_notifier_call_chain
>  cros_ec_irq_thread
>
> It was caused by a race condition: one thread just freed
> `active_scan_mask` at [1]; while another thread tried to access the
> memory at [2].
>
> Fix it by calling iio_device_claim_buffer_mode() to ensure the
> `indio_dev` can't exit buffer mode during cros_ec_sensors_push_data().
>
> [1]: https://elixir.bootlin.com/linux/v6.5/source/drivers/iio/industrialio-buffer.c#L1189
> [2]: https://elixir.bootlin.com/linux/v6.5/source/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c#L198
>
> Cc: stable@vger.kernel.org
> Fixes: aa984f1ba4a4 ("iio: cros_ec: Register to cros_ec_sensorhub when EC supports FIFO")
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
