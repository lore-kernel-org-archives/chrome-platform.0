Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA58A23A0
	for <chrome-platform@lists.linux.dev>; Mon,  6 Jun 2022 23:31:05 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id p129so17130211oig.3
        for <chrome-platform@lists.linux.dev>; Mon, 06 Jun 2022 16:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=+R99sP1E+YJ8V/C7V8qm0/rICq7UmmvLlPBjsI3F3Ow=;
        b=dKhMQYmUnygXdMLeEuMU0xGiJl9UgJwKjf8/RsmACBEtpyzET5tJxD7FaR+jKvOhYS
         7GtNAnbdGyp6gzpJL9zuR8BnALu2GLbWpgz2wfzN3xXiKQ3a6cpenvYeusZyhAW3BN+R
         HOBsN1VxX7pjzhyn70e7HrXjDp8GIPE1qQrlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=+R99sP1E+YJ8V/C7V8qm0/rICq7UmmvLlPBjsI3F3Ow=;
        b=SXdpNbrNnEtJm8Q0b3V6Ze3xAnp4TRdgsNgVFl/X1jTuJDlJP354qaAzjBm+1B1j0t
         zaQm71chJzemtBcZ+AgjYoNtuPVh2mz1wQ5Pwl+2BwqgP/wAgSF6z3arZnOTWV6kK41B
         Tusd9sca6PJK9Oj8JUk01gJumlPTebdMm7m+1Nizf4ArQSyaBThxj0WmbEBOuphmurbC
         YePvT8AVVACjvr7ANt0OMJMlUVPp6MaEo9+HU6VSI8yqHqjlTNu75NjzSETb7lapePYy
         lzUm67TB4stCqFKpZ/yQs5vOxaxd0Vsthq1JlF+emJahvmSbKKQ2AcjQmwVyMOm4giCo
         2vhA==
X-Gm-Message-State: AOAM531OAmnNFSNDJr8xy+m2a6csEwQgvbeeRpRXYKCIV84T8gZrNqhj
	Lg3Rwx4ZfJg2eNM604uIpqUXcxvcXoM57JFPYBByUA==
X-Google-Smtp-Source: ABdhPJzR5c8nv8+vHF7bA0iF44Ouo2hgGfY/3Fma+5GyZJXfDl7OqD4sgsm3BVVkVxAJA1OcF9ciIXiKVwihGwfaTyY=
X-Received: by 2002:a05:6808:e87:b0:32e:4789:d2c with SMTP id
 k7-20020a0568080e8700b0032e47890d2cmr12356912oil.193.1654558264904; Mon, 06
 Jun 2022 16:31:04 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jun 2022 16:31:04 -0700
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220606201825.763788-2-pmalani@chromium.org>
References: <20220606201825.763788-1-pmalani@chromium.org> <20220606201825.763788-2-pmalani@chromium.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 6 Jun 2022 16:31:04 -0700
Message-ID: <CAE-0n52hKCPwitrZNesh=NZKbXb76yR5xhAbyxh+5JaQAD3xZA@mail.gmail.com>
Subject: Re: [PATCH 1/3] regulator: cros-ec: Use common cros_ec_command()
To: Prashant Malani <pmalani@chromium.org>, linux-kernel@vger.kernel.org
Cc: bleung@chromium.org, chrome-platform@lists.linux.dev, 
	Daisuke Nojiri <dnojiri@chromium.org>, 
	Enric Balletbo i Serra <enric.balletbo@collabora.com>, Guenter Roeck <groeck@chromium.org>, 
	Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Quoting Prashant Malani (2022-06-06 13:18:01)
> Reduce code duplication by using the common cros_ec_command() function
> instead of the locally defined variant.
>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Prashant Malani <pmalani@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
