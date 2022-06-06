Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A6D28E6
	for <chrome-platform@lists.linux.dev>; Mon,  6 Jun 2022 15:24:33 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id m20so29586219ejj.10
        for <chrome-platform@lists.linux.dev>; Mon, 06 Jun 2022 08:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LkVR1NuQxjBXrvEq17FZVgpSOEkLzSQoABYmEhvkVmQ=;
        b=CaTMDhM8HArxhiM8wuEqYHguZd+Ow22R1fzwTFrTbpk5PuHjMdCTcfeVrzdHIBRYSW
         yQNBz17J5+HBN+JQkvdk3ejN61UBjSKi8HGWzdDLxf7gpdfUKwE+ucqdU6his7L0ZH2k
         A21jL8g4RkA9McGN05TmIXlJWekmGVckhdO8Dw04vJtoZhmIuWa+pd+axtIYooJ68K2a
         G9VYdMM/w9Uzgul5i1HfXU/AAHIbg4fhtv3hz55FfvkYzgRcJQ4FXjFmVwTDFOZjgSQS
         Q3teYiu6BRLeqyvOE2ZQd6AsRq3y5OaXApsexu0doVKJNt3+VAU9BR5H05k0eEJuW6pQ
         BXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LkVR1NuQxjBXrvEq17FZVgpSOEkLzSQoABYmEhvkVmQ=;
        b=3JtD5f2eN2B8mwI7xTRelrkZ4DtzKdlD0k/5/V6ljLe79b0hLEwzFdn2Z3h4W+zGVg
         FGTspKbQGJeNM7yQNYPTMR+s6p0kmaKjjKEXWr7Cf3cLPydGd5EHqkPjuOHrCNQHkaxj
         bfXyDAPGKPCkBPSyXCWsPlRypGEpZ6eGeHbjVawn5QzskXvN4sDY5tjb4HsDykWl1a9X
         +ldCEL1vWx0wSjYw5YYagaSv6ldwENCcByPPB5iarOUv+wQIKuzVnnXlwR+Ue2JUPYit
         SdBmjm0CrjmevS6b++9btcWAecP6HzKbShSn9UVgKx+MrP6dDnyWxlxGSl753jIvCpVq
         +tRQ==
X-Gm-Message-State: AOAM533TsURV0X2UjRIJV4pp8J5BsCzXfjpeNlZkw7LwMRJySiwokwmy
	d42qeJrF8DLnabKS88TNpgG791vGVzLDrCsALw/s1g==
X-Google-Smtp-Source: ABdhPJzahMapjCZ5wlUS2CyFN/NKvEDW1VCntlLo+6OrHYcPoPQkb3UsOtXoGGy5JESgoznkiN29l7/0VlFZ9Wk5PgY=
X-Received: by 2002:a17:906:4d50:b0:70d:afd4:1e63 with SMTP id
 b16-20020a1709064d5000b0070dafd41e63mr17459197ejv.618.1654529071847; Mon, 06
 Jun 2022 08:24:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220606141051.285823-1-tzungbi@kernel.org> <20220606141051.285823-5-tzungbi@kernel.org>
In-Reply-To: <20220606141051.285823-5-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Mon, 6 Jun 2022 08:24:20 -0700
Message-ID: <CABXOdTfoX+U=RWmnCha_9LuVcyhcz53MifuQwox8wQs6kangwg@mail.gmail.com>
Subject: Re: [PATCH 04/13] platform/chrome: cros_ec_proto: assign buffer size
 from protocol info
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 6, 2022 at 7:12 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> `din_size` is calculated from `ec_dev->max_response`.
> `ec_dev->max_response` is further calculated from the protocol info.
>
> To make it clear, assign `din_size` and `dout_size` from protocol info
> directly.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_proto.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
> index 65191af5139c..629dce3e6ab3 100644
> --- a/drivers/platform/chrome/cros_ec_proto.c
> +++ b/drivers/platform/chrome/cros_ec_proto.c
> @@ -449,12 +449,8 @@ int cros_ec_query_all(struct cros_ec_device *ec_dev)
>                         "using proto v%u\n",
>                         ec_dev->proto_version);
>
> -               ec_dev->din_size = ec_dev->max_response +
> -                       sizeof(struct ec_host_response) +
> -                       EC_MAX_RESPONSE_OVERHEAD;
> -               ec_dev->dout_size = ec_dev->max_request +
> -                       sizeof(struct ec_host_request) +
> -                       EC_MAX_REQUEST_OVERHEAD;
> +               ec_dev->din_size = proto_info->max_response_packet_size + EC_MAX_RESPONSE_OVERHEAD;
> +               ec_dev->dout_size = proto_info->max_request_packet_size + EC_MAX_REQUEST_OVERHEAD;
>
>                 /*
>                  * Check for PD
> --
> 2.36.1.255.ge46751e96f-goog
>
