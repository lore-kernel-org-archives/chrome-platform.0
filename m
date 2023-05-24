Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F14A1B8E4
	for <chrome-platform@lists.linux.dev>; Wed, 24 May 2023 17:42:30 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-625482282e0so91176d6.3
        for <chrome-platform@lists.linux.dev>; Wed, 24 May 2023 10:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684950149; x=1687542149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Xad8XQzT/EPDQLWCF9hW+e8DHp/sy9XMO4KserFr8E=;
        b=V+icCz8Wkib87kWDCS02h4LhRjsobBVVm1jhD52MjTvZmMBlrKW78D/7dLXkzzi12q
         6XXNonAITz3cc8q0J+zQ1M+Qste3MQhp/Bv7b324jyGSWhLTHIvgo/IozK/brYE4+mhO
         XQVs4A8fNuBbryXY4ncKCfTMncEVlMS2ozRaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684950149; x=1687542149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Xad8XQzT/EPDQLWCF9hW+e8DHp/sy9XMO4KserFr8E=;
        b=kZqVfoMnGZaydp1GA63/h1TvQ0m3Dyq0XxCIqndke3F3UibzX2iEPcvEB3UKWct9MA
         S4slTIAoGMBypNl6oNylCjy8aMdpDhcg9YM4fs1+iyYB+LZhCosM2jvjLnzk+GOtcNaE
         Y8atb0exI5LckUCEmugTPnfulfrLp9OxAgnkqnRmeL7+lW+I/AQDRh8rwfIqr/8Crh/w
         BzHBBLeDLPQkK1ZEQvTm37TphQkOCL/7ArH5MufGq4CWtzGv2teaa3LlhQ8m2g5OKuI8
         9NVo7Rl+K/fGoCjnzC4IArTFflRLNkQ7u14fkeDPofx96VS6qrisqTrUa6ssYWruwhwB
         KOEg==
X-Gm-Message-State: AC+VfDxygx7LZ4Y4gs9eL1+puSrsUR22NMwtoz//mwtFP+89GGKYEUQI
	7Z5Do3974lctcyyb33GR0alDaBKF7kf9j2EttDCvdw==
X-Google-Smtp-Source: ACHHUZ7VuoEl/eBzhNV09bqyw11BoMXJFgg/WXWeo6+8EEukNTKi78vrfyLQnNkdab7TTr1fcrkG9J5e3zT0+Gm80uo=
X-Received: by 2002:a05:6214:c6c:b0:623:8494:9946 with SMTP id
 t12-20020a0562140c6c00b0062384949946mr26307431qvj.45.1684950149123; Wed, 24
 May 2023 10:42:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230524122901.53659-1-heikki.krogerus@linux.intel.com> <20230524122901.53659-3-heikki.krogerus@linux.intel.com>
In-Reply-To: <20230524122901.53659-3-heikki.krogerus@linux.intel.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Wed, 24 May 2023 10:42:18 -0700
Message-ID: <CACeCKaendr7Z8xE44uQw-QZ66wMdV-jd8SQ+ZPUeOdVpkq8ZHw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] usb: typec: mux: Remove alt mode parameters from
 the API
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Andersson <andersson@kernel.org>, 
	chrome-platform@lists.linux.dev, linux-usb@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Benson Leung <bleung@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Heikki,

On Wed, May 24, 2023 at 5:29=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> The alt mode descriptor parameters are not used anymore.
>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Prashant Malani <pmalani@chromium.org>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Bjorn Andersson <andersson@kernel.org>

For cros-ec-typec:
Acked-by: Prashant Malani <pmalani@chromium.org>

Thanks,

-Prashant
