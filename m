Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE433D68
	for <chrome-platform@lists.linux.dev>; Mon, 11 Sep 2023 08:23:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1005C433C9;
	Mon, 11 Sep 2023 08:23:00 +0000 (UTC)
Message-ID: <70260067-b12e-41e2-841c-8ee019a67513@xs4all.nl>
Date: Mon, 11 Sep 2023 10:22:58 +0200
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: cros-ec-cec: Add Constitution to the match
 table
Content-Language: en-US, nl
To: Stefan Adolfsson <sadolfsson@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Reka Norman <rekanorman@chromium.org>, linux-media@vger.kernel.org,
 chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20230911081921.3515928-1-sadolfsson@google.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230911081921.3515928-1-sadolfsson@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/09/2023 10:19, Stefan Adolfsson wrote:
> From: Stefan Adolfsson <sadolfsson@chromium.org>
> 
> Constitution has two HDMI ports which support CEC:
>     Port B is EC port 0
>     Port A is EC port 1
> 
> This patch depends on "media: cros-ec-cec: Add Dibbi to the match
> table".
> 
> Signed-off-by: Stefan Adolfsson <sadolfsson@chromium.org>
> ---
> Changes in v2:
>  Use a NULL-terminated conns array for the match table entry
> 
>  drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
> index 21361eff50ff..85431af65224 100644
> --- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
> +++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
> @@ -296,6 +296,7 @@ struct cec_dmi_match {
>  
>  static const char *const fizz_conns[] = { "Port B", NULL };
>  static const char *const dibbi_conns[] = { "Port D", "Port B", NULL };
> +static const char *const constitution_conns[] = { "Port B", "Port A", NULL };
>  
>  static const struct cec_dmi_match cec_dmi_match_table[] = {
>  	/* Google Fizz */
> @@ -316,6 +317,8 @@ static const struct cec_dmi_match cec_dmi_match_table[] = {
>  	{ "Google", "Lisbon", "0000:00:02.0", fizz_conns },
>  	/* Google Dibbi */
>  	{ "Google", "Dibbi", "0000:00:02.0", dibbi_conns },
> +	/* Google Constitution */
> +	{ "Google", "Constitution", "0000:00:02.0", constitution_conns },
>  };
>  
>  static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,

I made that change myself when I merged your v1 patch. So I just mark this
v2 as Obsolete in patchwork.

Regards,

	Hans
