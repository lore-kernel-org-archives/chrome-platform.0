Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA5C7B
	for <chrome-platform@lists.linux.dev>; Wed,  8 Jun 2022 16:28:10 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id h23so31436787ejj.12
        for <chrome-platform@lists.linux.dev>; Wed, 08 Jun 2022 09:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eIhsgd4qYNDkbHY1tSv0TAemIX3YjvX24oBE2vbHP9s=;
        b=q4REp7vJNJCw7clXuyO3mj6Yi54h3u6xe9uA3nbJ7FWErSDyW4H4FiTzxAwD0uUZfU
         rM924OIqUo+ecqazXEQwTxo+pevPbqJkO9lGWVq5e/0lsQqp22kxsIvtP8o6qNm634vW
         X0DbF/nhg27S6az45V0JockL4wwUZfeyuqgtJxh2Xxdt0cCaVja+9kvo65UabcSX5tpZ
         gLP9dg8RJTj9bATBOqu8pPNaiU8gU4vnbbeee+YPxkPXmVLr9Lup+z7NX+sU6VNyWCyO
         ZULLu7dAJgWnt83TgddQryzx6212MqNGHCytA+99L5FYm9kT+DdlwLqlTwxq6/cP3Gol
         s5Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eIhsgd4qYNDkbHY1tSv0TAemIX3YjvX24oBE2vbHP9s=;
        b=N61LMvfu5mBMYGb92eATkbo8ck3euXensmYNH82xHtleTh9bbGQU7i4PAZ/BVWDxbT
         tXy7u6YmlrE1upPXqIlpMEWu9ik99aPio21lDL9ghdKYmyRSsf4jabQFvw6EOj6ClLMQ
         ocVuxnwtof/7qLAAo8Z8qK8uIalVzxAqXhKT3OSxBDoNL0KwlYuyoANcnEfdEcG9TNND
         fM59+h3Y5EKZ+TqozUpqLwcbYTcTT081FkfjosCpX6id1SNqn1c6ZkIKQCrU1Vf45y1v
         TffPjYKFulbdio51y5SctydvuhDlql9Aym6p4B4tLiwxBMfPTbnBHrdegckAyiHZkiIi
         VJEA==
X-Gm-Message-State: AOAM533dIIQ6siktVmKP8dRICLqsH/i0hRgURWRmsOrR7Dkh+oLAS3X7
	9pwAlK2vw6mJzVi5FMrJMaATh+d+plUEqCD8HKcE0A==
X-Google-Smtp-Source: ABdhPJwolD3lZVOpmYDr6xc0CANuwgDbVNbFIRuxCneLZAsPrI7uHQlv2+r6I1IBzQ0EaNTcNvqAO1MHwml1IL9yCKU=
X-Received: by 2002:a17:907:1ca8:b0:70c:68ce:dade with SMTP id
 nb40-20020a1709071ca800b0070c68cedademr29501960ejc.723.1654705688387; Wed, 08
 Jun 2022 09:28:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220608110734.2928245-1-tzungbi@kernel.org> <20220608110734.2928245-19-tzungbi@kernel.org>
 <CABXOdTdPwO6xv+DPcErZJcqZsLMMECcuk5MEYEpf4L3PYhSh7g@mail.gmail.com>
In-Reply-To: <CABXOdTdPwO6xv+DPcErZJcqZsLMMECcuk5MEYEpf4L3PYhSh7g@mail.gmail.com>
From: Guenter Roeck <groeck@google.com>
Date: Wed, 8 Jun 2022 09:27:57 -0700
Message-ID: <CABXOdTe_tG2e3MK=d6ZWggjj_=iYn7BFjhGOvOJBJ1JASx3NEw@mail.gmail.com>
Subject: Re: [PATCH v3 18/23] platform/chrome: cros_ec_proto: check
 `msg->result` in getting cmd mask
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 8, 2022 at 9:23 AM Guenter Roeck <groeck@google.com> wrote:
>
> On Wed, Jun 8, 2022 at 4:08 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> >
> > cros_ec_get_host_command_version_mask() should check if EC wasn't happy
> > by checking `msg->result`.
> >
> > Use cros_ec_map_error() and return the error code if any.
> >
> > Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> > ---
> > No v2.  New and separated from the original series.
> >
> >  drivers/platform/chrome/cros_ec_proto.c | 21 +++++++++++++--------
> >  1 file changed, 13 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
> > index 06bc7db1213e..6a5771361383 100644
> > --- a/drivers/platform/chrome/cros_ec_proto.c
> > +++ b/drivers/platform/chrome/cros_ec_proto.c
> > @@ -428,13 +428,12 @@ static int cros_ec_get_proto_info_legacy(struct cros_ec_device *ec_dev)
> >   * the caller has ec_dev->lock mutex or the caller knows there is
> >   * no other command in progress.
> >   */
> > -static int cros_ec_get_host_command_version_mask(struct cros_ec_device *ec_dev,
> > -       u16 cmd, u32 *mask)
> > +static int cros_ec_get_host_command_version_mask(struct cros_ec_device *ec_dev, u16 cmd, u32 *mask)
> >  {
> >         struct ec_params_get_cmd_versions *pver;
> >         struct ec_response_get_cmd_versions *rver;
> >         struct cros_ec_command *msg;
> > -       int ret;
> > +       int ret, mapped;
> >
> >         msg = kmalloc(sizeof(*msg) + max(sizeof(*rver), sizeof(*pver)),
> >                       GFP_KERNEL);
> > @@ -450,14 +449,20 @@ static int cros_ec_get_host_command_version_mask(struct cros_ec_device *ec_dev,
> >         pver->cmd = cmd;
> >
> >         ret = send_command(ec_dev, msg);
> > -       if (ret > 0) {
> > -               rver = (struct ec_response_get_cmd_versions *)msg->data;
> > -               *mask = rver->version_mask;
> > -               ret = 0;
> > +       if (ret < 0)
> > +               goto exit;
> > +
> > +       mapped = cros_ec_map_error(msg->result);
> > +       if (mapped) {
> > +               ret = mapped;
> > +               goto exit;
> >         }
> >
> What if ret == 0 ? Is that valid ?
>

Never mind, addressed in a follow-up patch.

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> Thanks,
> Guenter
>
> > +       rver = (struct ec_response_get_cmd_versions *)msg->data;
> > +       *mask = rver->version_mask;
> > +       ret = 0;
> > +exit:
> >         kfree(msg);
> > -
> >         return ret;
> >  }
> >
> > --
> > 2.36.1.255.ge46751e96f-goog
> >
