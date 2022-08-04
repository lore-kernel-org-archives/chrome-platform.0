Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA86210F
	for <chrome-platform@lists.linux.dev>; Thu,  4 Aug 2022 10:59:58 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-328303afa6eso45747217b3.10
        for <chrome-platform@lists.linux.dev>; Thu, 04 Aug 2022 03:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mYh7Ouih07Y3JkD/4mGPnS2e5gIQyHSI8E3r8KOj1vc=;
        b=oUwjUKM8jcd/JaE0oM61547C6N9OXxl5+tpApKpWs3g4cD4FmPmzuXjFJCmlZSqtGT
         RVd0ZwA2ntr1g/bgWzJ5+TcCpjOnnFQW/HQtRSPEQfsIxKWFLM/JIrQqWZds5kgWvj2T
         GnyIAMHEM6N90RW9JSK2B5g0dz7u+ci4ZV/U0Uk0J5613kSXMvkwBnD+6RnRbUUvfO+/
         XaENnOTnBDXOqZxAnVtQXSvu76TKbBlNNKCrbZ+mm2m9ZbAY1RrSRdieHWw1k5ynAQT1
         puJC+VaImpXclR2yDkggDC6xQA/XawXFQGMKNEEw53p/zO61G213O+jA51nZLq2liTRD
         vAIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mYh7Ouih07Y3JkD/4mGPnS2e5gIQyHSI8E3r8KOj1vc=;
        b=dGAsCZcPc0EwKIwFCVszfVcn9kU4hRRTcN/nHiD6EcX3ji7YSVZ0CPAAZdPXl/CJq3
         9se32Y0fJR80VQg7D7duyt3StxDHybGe7mVhk1mSTP5SkJWLyEO2HDouyTM/5GQSz8Nq
         YjB2UeEAKYMFWRhYIE1gVLIHTadwWrvw8O/CQkoNLA9npIXmgq3vXFlPezaukT8bX2WO
         JLX4HNxFXzHXEPOsnf9zNabJQR7wrD7avxcl8O7s8ToL8czcQitCIhZ1QgNwKiPKcpnV
         +7gkqgUF5sXHOLNRnQm7Gfj3JLvmCjHTagSkH8KnnBX5LOgX6KrBnSapXqev0Rw6T5+9
         4R/A==
X-Gm-Message-State: ACgBeo2N/ZNdzZja3DNfoZXCA5LiAB9CIb6CHE4u3FjmA2uj+C/ZgUj+
	T2yAZtnwcq5jaVc/oDDVKL0yBIgWboZX2LNky/UbtQ==
X-Google-Smtp-Source: AA6agR7lf5Dq9DgZgvvP2FPGckvJRR3LeclWaANwXGWpFM1rOqMiuHvwOGZ84pGNZvRCelokRf4Bk5BKMXgyOLIaVQk=
X-Received: by 2002:a81:b812:0:b0:328:68e4:c886 with SMTP id
 v18-20020a81b812000000b0032868e4c886mr1082057ywe.502.1659610797795; Thu, 04
 Aug 2022 03:59:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220714160951.9364-1-pdk@semihalf.com> <20220802154128.21175-1-pdk@semihalf.com>
 <YuuKu4b02siXj/TS@google.com>
In-Reply-To: <YuuKu4b02siXj/TS@google.com>
From: Patryk Duda <pdk@semihalf.com>
Date: Thu, 4 Aug 2022 12:59:42 +0200
Message-ID: <CAGOBvLpB2Xc5NDT_Ffq-_Bc-CRZQ6eAHV9ctSVkcOfqcCCc4Ag@mail.gmail.com>
Subject: Re: [PATCH v1] platform/chrome: cros_ec_proto: Update version on
 GET_NEXT_EVENT failure
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Gwendal Grignou <gwendal@google.com>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, upstream@semihalf.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

czw., 4 sie 2022 o 11:00 Tzung-Bi Shih <tzungbi@kernel.org> napisa=C5=82(a)=
:
>
> On Tue, Aug 02, 2022 at 05:41:28PM +0200, Patryk Duda wrote:
> > Fixes: 3300fdd630d4 ("platform/chrome: cros_ec: handle MKBP more events=
 flag")
> > Cc: <stable@vger.kernel.org> # 5.10+
>
> Any concerns if removing the Cc tag?  As I think a Fixes tag should be
> sufficient.  On a related note, why did you specify for only 5.10+?
Submitting patches document mentions that 'Fixes:' helps stable kernel
team in determining which stable kernel versions should receive the fix.

However, there is a note:
"Attaching a Fixes: tag does not subvert the stable kernel rules process
nor the requirement to Cc: stable@vger.kernel.org on all stable patch
candidates."
https://www.kernel.org/doc/html/v5.19/process/submitting-patches.html#using=
-reported-by-tested-by-reviewed-by-suggested-by-and-fixes

Stable kernel versions older than 5.10 don't suffer from this issue.
>
>
> > Signed-off-by: Patryk Duda <pdk@semihalf.com>
>
> You should collect the Reviewed-by tags the patch already got as dropping
> `ver_mask` initialization isn't a big change.  I could do that for the pa=
tch
> this time.
Thank you!
>
> [...]
> > v0 -> v1
> > - Dropped `ver_mask` initialization.
>
> Please start versioning from v1 next time.
Ok, thanks!
