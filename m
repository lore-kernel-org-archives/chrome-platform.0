Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EDCA20
	for <chrome-platform@lists.linux.dev>; Thu,  1 Dec 2022 19:42:04 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id n186so3134992oih.7
        for <chrome-platform@lists.linux.dev>; Thu, 01 Dec 2022 11:42:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dur5RhOwHPW6ErE9GhhtlulRkcLhMx1ZIi5Xd1tlnQs=;
        b=65dzFzZFlQhd9qeE5f9qcOcjEgkVlwsP5rrjTTkMeFQeVwzd8aotI3CC/RPQQ+n8mS
         CJb2cvb+skBw2KBFEOOs8WpY3UEjFaEWAETcMMqlFoo4dnhOLcFAl/jnk6toW+WpFuAg
         l/CM4GoTLOwdyQxFd0q7MGpTPSuRcqhVcgROrWNUS3JN+BiRERNrBLXcDMMnK1sVjiNz
         P7j1rMoHvrBBfcE/PlCdF3dHMYGHoolfSnQeR2KYXf6FO523+QTLBRX2MNOgNKG9T7lI
         GAYo1qjjb5Kk4eAoq2YwdyeYTu0vg+1oW9z70SEXyx9y9wnHmHyFGlveRcw2XeNsUaUb
         Oo4Q==
X-Gm-Message-State: ANoB5plAhRt3mM74ldzsEB2Qlez0hS1mys+JJNu0aFURebqajKbksPSD
	Q5zHt/NlwxGNk+06Ms0xXA==
X-Google-Smtp-Source: AA0mqf5cmTu8JwySJqKQ+jAawgWFQ+PAHGLNr9cF+cN3zf1Mjh47oQpxsLHcZAIVBKaJTBy/qmZlDg==
X-Received: by 2002:aca:bcc2:0:b0:354:4a93:10f7 with SMTP id m185-20020acabcc2000000b003544a9310f7mr22638410oif.220.1669923723413;
        Thu, 01 Dec 2022 11:42:03 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 124-20020a4a0d82000000b0049fcedf1899sm2121070oob.3.2022.12.01.11.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 11:42:03 -0800 (PST)
Received: (nullmailer pid 1218518 invoked by uid 1000);
	Thu, 01 Dec 2022 19:42:02 -0000
Date: Thu, 1 Dec 2022 13:42:02 -0600
From: Rob Herring <robh@kernel.org>
To: Mark Hasemeyer <markhas@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Raul Rangel <rrangel@chromium.org>, Bhanu Prakash Maiya <bhanumaiya@chromium.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Lee Jones <lee@kernel.org>, chrome-platform@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v8 2/3] dt-bindings: mfd: Add compatible string for UART
 support
Message-ID: <20221201194202.GA1215903-robh@kernel.org>
References: <20221130131245.v8.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>
 <20221130131245.v8.2.I9e018ecb8bdf341648cb64417085978ff0d22a46@changeid>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221130131245.v8.2.I9e018ecb8bdf341648cb64417085978ff0d22a46@changeid>

On Wed, Nov 30, 2022 at 01:12:55PM -0700, Mark Hasemeyer wrote:
> Add a compatible string to support the UART implementation of the cros
> ec interface.
> 
> Signed-off-by: Bhanu Prakash Maiya <bhanumaiya@chromium.org>
> Signed-off-by: Mark Hasemeyer <markhas@chromium.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> 
> Changes in v8:
> - Update commit message
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

serial {

> +        cros-ec {
> +            compatible = "google,cros-ec-uart";
> +        };
> +    };
>  ...
> -- 
> 2.38.1.584.g0f3c55d4c2-goog
> 
> 
