Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3946B138D
	for <chrome-platform@lists.linux.dev>; Tue,  3 Jan 2023 08:23:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37D76C433F0;
	Tue,  3 Jan 2023 08:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672734209;
	bh=Vx19a5fM3UWWsmRzyAEudxpAQbx7QwFdTxShf8tHuL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WuHPGWenPl+PO/3YSIXFQPh23Q7YnJvsoxF4TmpPeXXx29JSx+iunwr9wEVKhwGkw
	 eV5pE39zgeFoB71EpQxjdVbg9nLi8Z9liKpma0+t4ghVx8AYCRPtNKpa1MukSoHeFM
	 RuURsn9VEBJ49si8McV0I1sZtS8EkEyyCoCPTYq1tPcWfmJAwm8WVv8FZ+y76ysr2z
	 XWzN92BKHdtlDHXd8FCO9GE9URXbdIEsBZtmgbZ4zBUUeJmCBU3bvmVwcBz5495fTd
	 fN3++6LrhegkFGLP9dEt4LUwSrsADhRLE9O9ey03PWJHlCRSfWGfSMuLTd2eRqtWyT
	 8CCBh1lKJxr8g==
Date: Tue, 3 Jan 2023 08:23:22 +0000
From: Lee Jones <lee@kernel.org>
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	heikki.krogerus@linux.intel.com, Benson Leung <bleung@chromium.org>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	"Dustin L. Howett" <dustin@howett.net>,
	Evan Green <evgreen@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Kees Cook <keescook@chromium.org>, Lee Jones <lee.jones@linaro.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Xiang wangx <wangxiang@cdjrlc.com>
Subject: Re: [PATCH 01/10] Revert "mfd: cros_ec: Add SCP Core-1 as a new CrOS
 EC MCU"
Message-ID: <Y7Pl+gzs6ZEWDVH/@google.com>
References: <20221228004648.793339-1-pmalani@chromium.org>
 <20221228004648.793339-2-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221228004648.793339-2-pmalani@chromium.org>

On Wed, 28 Dec 2022, Prashant Malani wrote:

> This reverts commit 66ee379d743c69c726b61d078119a34d5be96a35.
> 
> The feature flag introduced by Commit 66ee379d743c ("mfd: cros_ec: Add
> SCP Core-1 as a new CrOS EC MCU") was not first added in the source EC
> code base[1]. This can lead to the possible misinterpration of an EC's
> supported feature set, as well as causes issues with all future feature
> flag updates.
> 
> [1] https://source.chromium.org/chromium/chromiumos/platform/ec/+/main:include/ec_commands.h
> 
> Signed-off-by: Prashant Malani <pmalani@chromium.org>
> ---
> 
> While this patch modifies drivers/mfd, it would be preferable to submit
> it through the chrome-platform tree, since that eliminates cross-tree
> dependencies for the series of which this patch is a part.

Shouldn't be an issue:

Acked-by: Lee Jones <lee@kernel.org>

>  drivers/mfd/cros_ec_dev.c                      | 5 -----
>  include/linux/platform_data/cros_ec_commands.h | 2 --
>  include/linux/platform_data/cros_ec_proto.h    | 1 -
>  3 files changed, 8 deletions(-)
> 
> diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
> index 344ad03bdc42..02d4271dfe06 100644
> --- a/drivers/mfd/cros_ec_dev.c
> +++ b/drivers/mfd/cros_ec_dev.c
> @@ -64,11 +64,6 @@ static const struct cros_feature_to_name cros_mcu_devices[] = {
>  		.name	= CROS_EC_DEV_SCP_NAME,
>  		.desc	= "System Control Processor",
>  	},
> -	{
> -		.id	= EC_FEATURE_SCP_C1,
> -		.name	= CROS_EC_DEV_SCP_C1_NAME,
> -		.desc	= "System Control Processor 2nd Core",
> -	},
>  	{
>  		.id	= EC_FEATURE_TOUCHPAD,
>  		.name	= CROS_EC_DEV_TP_NAME,
> diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
> index 5744a2d746aa..7c94bf5c8f05 100644
> --- a/include/linux/platform_data/cros_ec_commands.h
> +++ b/include/linux/platform_data/cros_ec_commands.h
> @@ -1300,8 +1300,6 @@ enum ec_feature_code {
>  	 * mux.
>  	 */
>  	EC_FEATURE_TYPEC_MUX_REQUIRE_AP_ACK = 43,
> -	/* The MCU is a System Companion Processor (SCP) 2nd Core. */
> -	EC_FEATURE_SCP_C1 = 45,
>  };
>  
>  #define EC_FEATURE_MASK_0(event_code) BIT(event_code % 32)
> diff --git a/include/linux/platform_data/cros_ec_proto.h b/include/linux/platform_data/cros_ec_proto.h
> index e43107e0bee1..a1f5b6d6db3a 100644
> --- a/include/linux/platform_data/cros_ec_proto.h
> +++ b/include/linux/platform_data/cros_ec_proto.h
> @@ -19,7 +19,6 @@
>  #define CROS_EC_DEV_ISH_NAME	"cros_ish"
>  #define CROS_EC_DEV_PD_NAME	"cros_pd"
>  #define CROS_EC_DEV_SCP_NAME	"cros_scp"
> -#define CROS_EC_DEV_SCP_C1_NAME	"cros_scp_c1"
>  #define CROS_EC_DEV_TP_NAME	"cros_tp"
>  
>  #define CROS_EC_DEV_EC_INDEX 0
> -- 
> 2.39.0.314.g84b9a713c41-goog
> 

-- 
Lee Jones [李琼斯]
