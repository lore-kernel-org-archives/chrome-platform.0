Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A22F6131
	for <chrome-platform@lists.linux.dev>; Tue, 30 Aug 2022 23:05:18 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id h27so9638179qkk.9
        for <chrome-platform@lists.linux.dev>; Tue, 30 Aug 2022 16:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=03xHIim8cJwL2orZIsFEEaPEGZ5A0SO9Xy6iHS5VgRo=;
        b=CLAQbMcLQlcO5FDKowqIzEN/KN92ak2XZyugeDeBWg7w2NposY2Jj0vc3RKSyaipPC
         5n+rz5aN9vrZdZcWobBxzExvlxNeAKQ+/ORw9XCHzmowsMF8FfKOBcIgL7f+sBLdAcVE
         pzG6rVKv/POhYE0VTsQSMArU1JrCgmEL0sSco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=03xHIim8cJwL2orZIsFEEaPEGZ5A0SO9Xy6iHS5VgRo=;
        b=x0GPootJq+VUKXmCyaj5FS1jZWTXmxyI3Uk5GNuLQSr605uQuSd8oKlGxk1C5hP7Xj
         N8gL6PxZyz1hml8JYc77M5TwDmjQX6JdXtTWCmXNpiN5unYWiKdAFYfUUTtK7kVyZiXL
         DIACEvWN6Y4dALweJb89/+HQQ51DLIevb9EcFV+Nr/9G4RKHDkAH2wsdt+OdqrA9MXuS
         wx+YWIPWFuKuqtx2BR/T5NSeBmp6XLjcvuezGyItNdVxH7daiXKlp6CU0IprAozxTx09
         txdLOM0+dp8hiyMX4pmI92IBK9wSXymJ9Ww7QMErzsOF9xSdSU7TbHM83PK1J9RXxAg7
         bHIA==
X-Gm-Message-State: ACgBeo2TtzFFEnvNaMEiFa7RoWbVPLuimEWfnxHINimy85cw+1rfouu3
	aXpPPCLUxCqgLMZiEgud1rqUUyTyEMd7gz4M3pxcvA==
X-Google-Smtp-Source: AA6agR5RMu+MBNHzM+xUm2TPO1Kqe1FQ42HmfdhzT9rRFEuR+Os0L/+2NDY1lvV3K+ZVgoBLveHvEHFmFHN2ebLu6kc=
X-Received: by 2002:a05:620a:4088:b0:6bc:60a5:bba9 with SMTP id
 f8-20020a05620a408800b006bc60a5bba9mr13980652qko.170.1661900717259; Tue, 30
 Aug 2022 16:05:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220830225831.2362403-1-swboyd@chromium.org> <20220830225831.2362403-3-swboyd@chromium.org>
In-Reply-To: <20220830225831.2362403-3-swboyd@chromium.org>
From: Prashant Malani <pmalani@chromium.org>
Date: Tue, 30 Aug 2022 16:05:05 -0700
Message-ID: <CACeCKae7ZCATSyHMupDynVye+CyKAqQMDU6GPKPXhf5Zibjihg@mail.gmail.com>
Subject: Re: [PATCH 2/4] platform/chrome: cros_typec_switch: Remove impossible condition
To: Stephen Boyd <swboyd@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, chrome-platform@lists.linux.dev, 
	Tzung-Bi Shih <tzungbi@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 30, 2022 at 3:58 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> The type of 'index' is unsigned long long, which can't possibly be less
> than zero. Remove the impossible check.
>
> Cc: Prashant Malani <pmalani@chromium.org>
> Cc: Tzung-Bi Shih <tzungbi@kernel.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
Acked-by: Prashant Malani <pmalani@chromium.org>
