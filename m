Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C6C20FD
	for <chrome-platform@lists.linux.dev>; Fri, 18 Nov 2022 12:42:14 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id 97so1688749uam.0
        for <chrome-platform@lists.linux.dev>; Fri, 18 Nov 2022 04:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lR6xTYRY7MgkfHig5h9+QBVHckUH85lhudbs/NLAfWU=;
        b=aSWpS3mKYDiCnOkBIsX+22S6pBFOEOgidnAmfkAVD+J2aGHAvlVyr5NsEQISwtWry1
         s714L0cDxT4dIUjWZ26hqjYEf41F0jlvnyFp3tmJ+tNGIkqwsF0iBSgiBwzirjV8BEFW
         3OsAZhXsf6/XNSUVkenujcjaqGH7kB0ROyfh79OYDAtjK3Jm/c1cXe/6Buoo5C9VLBTW
         QTUzrWzvhC+ZRVSCHdEwXukGYQ2Pnl5w8H9OFaw90jnI5qRNpQ9ew6Y/cVB00RwbOUe+
         IJoBozL1RkfQkEbQe4e8BiHKWg6EyHiu/2DORvSGYtSNyYqtTBtjS9s0aLxJZv5sP1Nk
         WfQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lR6xTYRY7MgkfHig5h9+QBVHckUH85lhudbs/NLAfWU=;
        b=3oj/gXr8o6IeEOOZnzJ+IpaXBwQB0jwSCgFmOnltVZKYUcgGdJETlcKvahZ72phlFD
         oqKLtHkKCEsLLi+ipkKtsxQuTQv8CEwYp7726sF5CpArFkIWG8kTkP5Cf4p0lPNuU1Vy
         ZeLWGQbCaqk/iEF4ffSl5rngX8CcdZHXgiTCsBt7nB00GY3I/zhd6rRo0bb4APU1opRq
         j79kP3tS1YmlTsquA+u83r1wWcHvnGBLwpfuCXnzVGtFzOSBtLrGla89pE/KYQiiAWLB
         6/51KsMhoP8jzKDT/pi65yAo9kZClGE43V/sLH8BfKQy4VP/qojmGAU1wTO84CbdWyy8
         uuLw==
X-Gm-Message-State: ANoB5pkGzH219CQKQeZIFYp+y55agjVNe/VOB1lLc0c1FZW7Y/WiOI8B
	OVKvzbDyBtVuDBuXtlUSDeTZQrq/jWsmkAaLP2dQ5g==
X-Google-Smtp-Source: AA0mqf7mGBV/TWyE4B8wNnzY/00pkB9i2ya3rMZZIkqwL+3LlYjws14OhWdWW2FOvqapZnlxd62JQdHqdYPgEw1XNiY=
X-Received: by 2002:ab0:6caa:0:b0:409:a03b:1bbb with SMTP id
 j10-20020ab06caa000000b00409a03b1bbbmr3840981uaa.55.1668775333718; Fri, 18
 Nov 2022 04:42:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221117114818.v7.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>
 <20221117114818.v7.2.I9e018ecb8bdf341648cb64417085978ff0d22a46@changeid>
In-Reply-To: <20221117114818.v7.2.I9e018ecb8bdf341648cb64417085978ff0d22a46@changeid>
From: Guenter Roeck <groeck@google.com>
Date: Fri, 18 Nov 2022 04:42:02 -0800
Message-ID: <CABXOdTfB9DA1LX3qj4QiHdTuJwV_OnP3eUEyTUvHzX3L3jnkNA@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] dt-bindings: mfd: Add DT compatible string "google,cros_ec_uart"
To: Mark Hasemeyer <markhas@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Raul Rangel <rrangel@chromium.org>, 
	Bhanu Prakash Maiya <bhanumaiya@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, chrome-platform@lists.linux.dev, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 17, 2022 at 10:49 AM Mark Hasemeyer <markhas@chromium.org> wrote:
>
> Add DT compatible string in
> Documentation/devicetree/bindings/mfd/cros_ec.txt
>

This is now google,cros-ec.yaml

Guenter

> Signed-off-by: Bhanu Prakash Maiya <bhanumaiya@chromium.org>
> Signed-off-by: Mark Hasemeyer <markhas@chromium.org>
> ---
>
> Changes in v7:
> - No change
>
> Changes in v6:
> - No change
>
> Changes in v5:
> - No change
>
> Changes in v4:
> - Changes in commit message.
>
> Changes in v3:
> - Rebased changes on google,cros-ec.yaml
>
> Changes in v2:
> - No change
>
> ---
>  .../devicetree/bindings/mfd/google,cros-ec.yaml       | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> index 04962bb29576e..26787e4574b8d 100644
> --- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> +++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> @@ -28,6 +28,9 @@ properties:
>        - description:
>            For implementations of the EC is connected through RPMSG.
>          const: google,cros-ec-rpmsg
> +      - description:
> +          For implementations of the EC is connected through UART.
> +        const: google,cros-ec-uart
>
>    controller-data:
>      description:
> @@ -222,4 +225,12 @@ examples:
>              compatible = "google,cros-ec-rpmsg";
>          };
>      };
> +
> +  # Example for UART
> +  - |
> +    uart0 {
> +        cros-ec {
> +            compatible = "google,cros-ec-uart";
> +        };
> +    };
>  ...
> --
> 2.38.1.584.g0f3c55d4c2-goog
>
