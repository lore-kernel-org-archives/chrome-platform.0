Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C9717D7
	for <chrome-platform@lists.linux.dev>; Fri, 20 May 2022 10:48:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B74B9C385A9;
	Fri, 20 May 2022 10:48:28 +0000 (UTC)
Message-ID: <67deb2d6-cb04-ddb3-6c24-14d8ecb31ed9@xs4all.nl>
Date: Fri, 20 May 2022 12:48:26 +0200
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] [v2] media/platform-wide: platform: Add moli to the match
 table
Content-Language: en-US
To: Scott Chao <scott_chao@wistron.corp-partner.google.com>
Cc: mchehab@kernel.org, bleung@chromium.org, groeck@chromium.org,
 zhuohao@chromium.org, linux-media@vger.kernel.org,
 chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220520104253.26054-1-scott_chao@wistron.corp-partner.google.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20220520104253.26054-1-scott_chao@wistron.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Huh? The Subject is now *really* bad. I think you misunderstood my comment
on the original patch.

"[PATCH] media: platform: foo" suggests a patch touching on many drivers in
drivers/media/platform. But this patch only touches on a single driver, so:

"[PATCH] media: platform: cros-ec: foo"

That way the maintainer of that driver will see the name of the driver in the
subject as well, and might comment upon it.

Regards,

	Hans

On 5/20/22 12:42, Scott Chao wrote:
> The Google Moli device uses the same approach as the Google Brask
> which enables the HDMI CEC via the cros-ec-cec driver.
> 
> Signed-off-by: Scott Chao <scott_chao@wistron.corp-partner.google.com>
> ---
>  drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
> index 8c8d8fc5e63e..25dc7309beab 100644
> --- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
> +++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
> @@ -217,6 +217,8 @@ static const struct cec_dmi_match cec_dmi_match_table[] = {
>  	{ "Google", "Fizz", "0000:00:02.0", "Port B" },
>  	/* Google Brask */
>  	{ "Google", "Brask", "0000:00:02.0", "Port B" },
> +	/* Google Moli */
> +	{ "Google", "Moli", "0000:00:02.0", "Port B" },
>  };
>  
>  static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
