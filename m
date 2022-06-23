Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199DA1FB2
	for <chrome-platform@lists.linux.dev>; Thu, 23 Jun 2022 16:38:23 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id z7so29324816edm.13
        for <chrome-platform@lists.linux.dev>; Thu, 23 Jun 2022 09:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AAlxQgMTHS8WASi4S9BFRIXGatijsC0zjEnIxlEzU0o=;
        b=c2Opogx1Bd/U//9VL4xN3Ue/JcsrrLE/FiXi6Nbwp8mDyOyTL6h8z0ZwfClfqhlC9Z
         2E8Hecn/mkFBg/hGr9QnGk1foO5bOUbdW3QdCgYDxP4XNFppRM5x/z7uI1xK/cBIZftA
         JdMVGpjr50DGlgPiSrNX7Wb7Epu27mlZZCddPUprefJtNP1Fowd+wYwfaA1spO66tkuY
         XShc1+xoXPbCCYcWko7bva5VYupOwlJaBYwLVKLdYdJiwmGrNN+j0iOUwRZ6sFOVmu3c
         asBSS0K4EnJmQiTIQIkvXYnn1VnttUK4OK4Oq/ZIQByORMqVzlzVPDLNo4zXiQ1xRzD7
         e/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AAlxQgMTHS8WASi4S9BFRIXGatijsC0zjEnIxlEzU0o=;
        b=LdLsg9BLzsVqbk2VctGpnm3lMU+2fARb0pll1x3U0GGyqv9Ejzx8gRiRMh9G4J06Kg
         IUOxerGfSun61VCoFx+GSgZkuNm3IbYPCjbWuRc9ivbY1oWYTvVGgrFEL9yKLV8O34Yo
         gnpZAxwJdMnSPTT8vsiJDSANyNTQkOuEa36HOiXzo5MEGFtkUxiHrXFUuriSF7EMejJ+
         rZ4PZi37uqivn/7/pErbTRQ+EEfVubyoUuljvOPa1tfNXZMyGWO3M6Whg8JXAy66yVW+
         b8/dt2n+vo+AUcj1jAZQuAZEJJkR8slID5yw1JPt4ADh0mr237h6FdaKvOesVkYa2X6L
         l5PQ==
X-Gm-Message-State: AJIora/BIYTjm33N0bCGVo7ROvm+n1lP7Dzd1vFD97AwxEuwuW8TiE8R
	txgq9uAMzlhPP/L8L/JFMfM+BR+7DmAgVEgGyV2eDw==
X-Google-Smtp-Source: AGRyM1uox2maQgIrsXGHPliPlOMPr+sIaCyTcwN2FF3VUu3js79EX3dVQ/MjttufXm+TNlb7eGKNZpVY6G4fdztUikc=
X-Received: by 2002:a05:6402:5193:b0:435:9a5f:50a8 with SMTP id
 q19-20020a056402519300b004359a5f50a8mr12033999edd.212.1656002302254; Thu, 23
 Jun 2022 09:38:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220622041040.202737-1-tzungbi@kernel.org> <20220622041040.202737-5-tzungbi@kernel.org>
In-Reply-To: <20220622041040.202737-5-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Thu, 23 Jun 2022 09:38:10 -0700
Message-ID: <CABXOdTfuiVan-Rascq1X-hrvf-68FPu636G1T-v6fA-kUhMArg@mail.gmail.com>
Subject: Re: [PATCH 4/7] platform/chrome: cros_ec_proto: add Kunit tests for get_host_event
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 21, 2022 at 9:11 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> cros_ec_get_host_event() performs some sanity checks, parses
> `ec_dev->event_data.data.host_event`, and returns bitmap of
> EC_HOST_EVENT_*.
>
> Add Kunit tests for cros_ec_get_host_event().
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_proto_test.c | 59 ++++++++++++++++++++
>  1 file changed, 59 insertions(+)
>
> diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platform/chrome/cros_ec_proto_test.c
> index 64c4b79f7a0c..dce9fa3b9c8d 100644
> --- a/drivers/platform/chrome/cros_ec_proto_test.c
> +++ b/drivers/platform/chrome/cros_ec_proto_test.c
> @@ -2312,6 +2312,61 @@ static void cros_ec_proto_test_get_next_event_mkbp_event_host_event_masked(struc
>         }
>  }
>
> +static void cros_ec_proto_test_get_host_event_no_mkbp_event(struct kunit *test)
> +{
> +       struct cros_ec_proto_test_priv *priv = test->priv;
> +       struct cros_ec_device *ec_dev = &priv->ec_dev;
> +       int ret;
> +
> +       ec_dev->mkbp_event_supported = 0;
> +
> +       ret = cros_ec_get_host_event(ec_dev);
> +       KUNIT_EXPECT_EQ(test, ret, 0);
> +}
> +
> +static void cros_ec_proto_test_get_host_event_not_host_event(struct kunit *test)
> +{
> +       struct cros_ec_proto_test_priv *priv = test->priv;
> +       struct cros_ec_device *ec_dev = &priv->ec_dev;
> +       int ret;
> +
> +       ec_dev->mkbp_event_supported = 1;
> +       ec_dev->event_data.event_type = EC_MKBP_EVENT_FINGERPRINT;
> +
> +       ret = cros_ec_get_host_event(ec_dev);
> +       KUNIT_EXPECT_EQ(test, ret, 0);
> +}
> +
> +static void cros_ec_proto_test_get_host_event_wrong_event_size(struct kunit *test)
> +{
> +       struct cros_ec_proto_test_priv *priv = test->priv;
> +       struct cros_ec_device *ec_dev = &priv->ec_dev;
> +       int ret;
> +
> +       ec_dev->mkbp_event_supported = 1;
> +       ec_dev->event_data.event_type = EC_MKBP_EVENT_HOST_EVENT;
> +       ec_dev->event_size = 0xff;
> +
> +       ret = cros_ec_get_host_event(ec_dev);
> +       KUNIT_EXPECT_EQ(test, ret, 0);
> +}
> +
> +static void cros_ec_proto_test_get_host_event_normal(struct kunit *test)
> +{
> +       struct cros_ec_proto_test_priv *priv = test->priv;
> +       struct cros_ec_device *ec_dev = &priv->ec_dev;
> +       int ret;
> +
> +       ec_dev->mkbp_event_supported = 1;
> +       ec_dev->event_data.event_type = EC_MKBP_EVENT_HOST_EVENT;
> +       ec_dev->event_size = sizeof(ec_dev->event_data.data.host_event);
> +       put_unaligned_le32(EC_HOST_EVENT_MASK(EC_HOST_EVENT_RTC),
> +                          &ec_dev->event_data.data.host_event);
> +
> +       ret = cros_ec_get_host_event(ec_dev);
> +       KUNIT_EXPECT_EQ(test, ret, EC_HOST_EVENT_MASK(EC_HOST_EVENT_RTC));
> +}
> +
>  static void cros_ec_proto_test_release(struct device *dev)
>  {
>  }
> @@ -2401,6 +2456,10 @@ static struct kunit_case cros_ec_proto_test_cases[] = {
>         KUNIT_CASE(cros_ec_proto_test_get_next_event_mkbp_event_version2),
>         KUNIT_CASE(cros_ec_proto_test_get_next_event_mkbp_event_host_event_rtc),
>         KUNIT_CASE(cros_ec_proto_test_get_next_event_mkbp_event_host_event_masked),
> +       KUNIT_CASE(cros_ec_proto_test_get_host_event_no_mkbp_event),
> +       KUNIT_CASE(cros_ec_proto_test_get_host_event_not_host_event),
> +       KUNIT_CASE(cros_ec_proto_test_get_host_event_wrong_event_size),
> +       KUNIT_CASE(cros_ec_proto_test_get_host_event_normal),
>         {}
>  };
>
> --
> 2.37.0.rc0.104.g0611611a94-goog
>
